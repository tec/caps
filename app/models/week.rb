#require 'active_model'

module Week

  DAYS_PER_WEEK = 0..5
  def self.included(base)
    base.class_eval do
      validates_numericality_of :days_per_week, :greater_than_or_equal_to => Week::DAYS_PER_WEEK.min, :less_than_or_equal_to => Week::DAYS_PER_WEEK.max
    end
  end  

  def self.get_monday year, week
    Date.commercial(year.to_i, week.to_i, 1)
  end

  # returns true if object responds to from_year, from_week and attributes
  def is_week_model?
    return self.respond_to?(:from_year) &&
      self.respond_to?(:from_week) &&
      self.respond_to?(:attributes) &&
      self.from_year.respond_to?(:to_i) &&
      self.from_week.respond_to?(:to_i) &&
      self.attributes.respond_to?(:to_a)
  end

  def self.previous_week year, week
    previous_week = Week.get_monday(year, week) - 1.week
    {:year => previous_week.cwyear, :week => previous_week.cweek}
  end

  def self.next_week year, week
    next_week = Week.get_monday(year, week) + 1.week
    {:year => next_week.cwyear, :week => next_week.cweek}
  end

  def previous_week
    return nil unless self.is_week_model?
    Week.previous_week self.from_year, self.from_week 
  end

  def next_week
    return nil unless self.is_week_model?
    Week.next_week self.from_year, self.from_week
  end

  # find the last previous item where all belongs_to relations have the same targets 
  def previous
    return nil unless self.is_week_model?
    pre_week = self.previous_week

    pre = self.class.where( "from_year < ? or (from_year = ? AND from_week <= ?)",
                           pre_week[:year], pre_week[:year], pre_week[:week] )
    self.attributes.each do |attr, value| 
      pre = pre.where( attr.to_sym => self.send(attr.to_sym) ) if attr.ends_with? '_id'
    end
    pre = pre.order( :from_year, :from_week )
    pre = pre.last
  end

  def previous_days
    pre = self.previous
    pre.respond_to?(:days_per_week) ? pre.days_per_week : 0
  end

  def update_or_delete attributes
    if  (attributes[:from_year].nil?  || attributes[:from_year].to_i  == self.from_year) &&
        (attributes[:from_week].nil?  || attributes[:from_week].to_i  == self.from_week) &&
        (attributes[:worker_id].nil?  || attributes[:worker_id].to_i  == self.worker_id) &&
        (attributes[:project_id].nil? || attributes[:project_id].to_i == self.project_id) &&
        attributes[:days_per_week].present? && attributes[:days_per_week] != self.days_per_week
      update_or_delete_days_per_week attributes
    else
      update_attributes attributes
    end
  end

  protected

  def update_or_delete_days_per_week attributes
    previous_days_per_week = self.previous_days
    if previous_days_per_week == attributes[:days_per_week].to_i
      self.destroy
    else
      update_attributes attributes
    end
  end
end

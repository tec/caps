class Week

  def initialize year, week
    @year = year
    @week = week
  end

  def year
    @year
  end

  def week
    @week
  end

  def previous
    previous_week = Date.commercial(@year, @week, 1) - 1.week
    Week.new(previous_week.cwyear, previous_week.cweek)
  end

  def next
    next_week = Date.commercial(@year, @week, 1) + 1.week
    Week.new(next_week.cwyear, next_week.cweek)
  end

  def self.is_week_model item
    return item.respond_to?(:from_year) &&
      item.respond_to?(:from_week) &&
      item.respond_to?(:attributes) &&
      item.from_year.respond_to?(:to_i) &&
      item.from_week.respond_to?(:to_i) &&
      item.attributes.respond_to?(:to_a)
  end

  # find the last previous item where all belongs_to relations have the same targets 
  # item needs to be a week model, i.e. respond to from_year, from_week and attributes
  def self.previous item
    return nil unless self.is_week_model item
    pre_week = Week.new(item.from_year.to_i, item.from_week.to_i).previous

    pre = item.class.where( "from_year < ? or (from_year = ? AND from_week <= ?)",
                           pre_week.year, pre_week.year, pre_week.week )
    item.attributes.each do |attr, value| 
      pre = pre.where( attr.to_sym => item.send(attr.to_sym) ) if attr.ends_with? '_id'
    end
    pre = pre.order( :from_year, :from_week )
    pre = pre.last
  end

  def self.previous_days_per_week item
    pre = self.previous item
    pre.respond_to?(:days_per_week) ? pre.days_per_week : 0
  end
end

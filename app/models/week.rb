module Week

  # returns true if object responds to from_year, from_week and attributes
  def is_week_model?
    return self.respond_to?(:from_year) &&
      self.respond_to?(:from_week) &&
      self.respond_to?(:attributes) &&
      self.from_year.respond_to?(:to_i) &&
      self.from_week.respond_to?(:to_i) &&
      self.attributes.respond_to?(:to_a)
  end

  def previous_week
    return nil unless self.is_week_model?
    previous_week = Date.commercial(self.from_year, self.from_week, 1) - 1.week
    {:year => previous_week.cwyear, :week => previous_week.cweek}
  end

  def next_week
    return nil unless self.is_week_model?
    next_week = Date.commercial(self.from_year, self.from_week, 1) + 1.week
    {:year => next_week.cwyear, :week => next_week.cweek}
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
end

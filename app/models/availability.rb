class Availability < ActiveRecord::Base
  include Week
  belongs_to :worker
  validates_numericality_of :days_per_week, :greater_than_or_equal_to => Week::DAYS_PER_WEEK.min, :less_than_or_equal_to => Week::DAYS_PER_WEEK.max

  def self.get_availabilities year, week
    get_workers do |worker|
        availability = worker.get_availability year, week 
        if availability.nil?
          availability = Availability.new :from_year => year, :from_week => week, :worker => worker
        elsif availability.from_year != year.to_i || availability.from_week != week.to_i
          availability = Availability.new :from_year => year, :from_week => week, :worker => worker, :days_per_week => availability.days_per_week
        end
        availability
    end
  end

  def self.get_availability_days year, week
    get_workers do |worker| 
        availability = worker.get_availability year, week 
        [worker, availability.present? ? availability.days_per_week : 0]
    end
  end

  def self.get_workers
    Hash[Worker.all.map do | worker |
      [worker, yield(worker)]
    end]
  end
end

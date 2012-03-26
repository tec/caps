class Worker < ActiveRecord::Base

  has_many :availabilities
  has_many :assignments

  def get_available_days year, week
    availability = get_availability( year, week )
    availability.present? ? availability.days_per_week : 0
  end
  
  def get_availability year, week
    Availability.
      where( :worker_id => self.id ).
      where( "from_year < ? or (from_year = ? AND from_week <= ?)", year, year, week ).
      order( :from_year, :from_week ).
      last
  end
  
  def get_assignment project, year, week
    Assignment.
      where( :worker_id => self.id ).
      where( :project_id => project.id ).
      where( "from_year < ? or (from_year = ? AND from_week <= ?)", year, year, week ).
      order( :from_year, :from_week ).
      last
  end
end

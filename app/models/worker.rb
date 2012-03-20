class Worker < ActiveRecord::Base

  has_many :availabilities
  has_many :assignments

  def get_availability year, week
    Availability.
      where( :worker_id => self.id ).
      where( "from_year < ? or (from_year = ? AND from_week <= ?)", year, year, week ).
      order( :from_year, :from_week ).
      last
  end
end

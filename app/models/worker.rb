class Worker < ActiveRecord::Base

  has_many :availabilities
  has_many :assignments

  def get_availability year, week
    Availability.
      where( :worker_id => self.id ).
      where( "from_year <= ?", year ).
      where( "from_week <= ?", week ).
      order( :from_year, :from_week ).
      last
  end
end

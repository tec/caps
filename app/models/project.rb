class Project < ActiveRecord::Base
  has_many :workloads
  has_many :assignments
  
  def get_workload year, week
    Workload.
      where( :project_id => self.id ).
      where( "from_year <= ?", year ).
      where( "from_week <= ?", week ).
      order( :from_year, :from_week ).
      last
  end
end

class Project < ActiveRecord::Base
  has_many :workloads
  has_many :assignments
  
  def self.get_work_days year, week
    Hash[Project.all.map do | project | 
      [project.id, {
        :name => project.name, 
        :workload => project.get_work_days( year, week )
      }]
    end]
  end
  
  def get_work_days year, week
    workload = get_workload( year, week )
    workload.present? ? workload.days_per_week : 0
  end
  
  def get_workload year, week
    Workload.
      where( :project_id => self.id ).
      where( "from_year < ? or (from_year = ? AND from_week <= ?)", year, year, week ).
      order( :from_year, :from_week ).
      last
  end
end

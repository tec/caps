class Project < ActiveRecord::Base
  has_many :workloads
  has_many :assignments
  
  def get_workload year, week
    Workload.
      where( :project_id => self.id ).
      where( "from_year < ? or (from_year = ? AND from_week <= ?)", year, year, week ).
      order( :from_year, :from_week ).
      last
  end
  def get_assignment worker, year, week
    worker.get_assignment self, year, week
  end
  def get_assignments year, week
    Worker.all.map do |worker|
      self.get_assignment( worker, year, week)
    end
  end
end

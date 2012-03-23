class Assignment < ActiveRecord::Base
  belongs_to :worker
  belongs_to :project
  
  def self.get_assigned_days_per_worker year, week
    Worker.all.map do | worker | 
      {
        :worker_id => worker.id, 
        :assignments => worker.get_assigned_days_per_project( year, week )
      }
    end
  end
end

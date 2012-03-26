class Assignment < ActiveRecord::Base
  belongs_to :worker
  belongs_to :project
  
  def self.get_assignment_table year, week
    Hash[Worker.all.map do | worker |
      [worker,
      Hash[Project.all.map do | project |
        assignment = worker.get_assignment project, year, week 
        [project,
         assignment.present? ? assignment.days_per_week : 0]
      end]]
    end]
  end
end

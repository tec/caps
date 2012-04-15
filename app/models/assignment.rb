class Assignment < ActiveRecord::Base
  belongs_to :worker
  belongs_to :project
  
  def self.get_assignments year, week
    get_worker_project_table do |worker, project|
        assignment = worker.get_assignment project, year, week 
        if assignment.nil?
          assignment = Assignment.new :from_year => year, :from_week => week, :worker => worker, :project => project
        elsif assignment.from_year != year.to_i || assignment.from_week != week.to_i
          assignment = Assignment.new :from_year => year, :from_week => week, :worker => worker, :project => project, :days_per_week => assignment.days_per_week
        end
        [project, assignment]
    end
  end
  def self.get_assignment_days year, week
    get_worker_project_table do |worker, project| 
        assignment = worker.get_assignment project, year, week 
        [project, assignment.present? ? assignment.days_per_week : 0]
    end
  end
  def self.get_worker_project_table
    Hash[Worker.all.map do | worker |
      [worker,
      Hash[Project.all.map do | project |
           yield worker, project
      end]]
    end]
  end
end

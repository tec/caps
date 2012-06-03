class Workload < ActiveRecord::Base
  include Week
  belongs_to :project

  def self.get_workloads year, week
    get_projects do |project|
        workload = project.get_workload year, week 
        if workload.nil?
          workload = Workload.new :from_year => year, :from_week => week, :project => project
        elsif workload.from_year != year.to_i || workload.from_week != week.to_i
          workload = Workload.new :from_year => year, :from_week => week, :project => project, :days_per_week => workload.days_per_week
        end
        workload
    end
  end

  def self.get_workload_days year, week
    get_projects do |project| 
        workload = worker.get_workload year, week 
        [project, workload.present? ? workload.days_per_week : 0]
    end
  end

  def self.get_projects
    Hash[Project.all.map do | project |
      [project, yield(project)]
    end]
  end
end

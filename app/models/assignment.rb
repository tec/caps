class Assignment < ActiveRecord::Base
  include Week
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

  def update_or_delete attributes
    if  (attributes[:from_year].nil?  || attributes[:from_year].to_i  == self.from_year) &&
        (attributes[:from_week].nil?  || attributes[:from_week].to_i  == self.from_week) &&
        (attributes[:worker_id].nil?  || attributes[:worker_id].to_i  == self.worker_id) &&
        (attributes[:project_id].nil? || attributes[:project_id].to_i == self.project_id) &&
        attributes[:days_per_week].present? && attributes[:days_per_week] != self.days_per_week
      update_or_delete_days_per_week attributes
    else
      update_attributes attributes
    end
  end

  protected

  def update_or_delete_days_per_week attributes
    previous_days_per_week = self.previous_days
    if previous_days_per_week == attributes[:days_per_week].to_i
      self.destroy
    else
      update_attributes attributes
    end
  end

end

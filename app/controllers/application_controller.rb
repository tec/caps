class ApplicationController < ActionController::Base
  protect_from_forgery
  
  respond_to :html, :json

  def index
    @year = params[:year]
    @week = params[:week]
    @workers = Worker.all
    @projects = Project.all
    @assignments = Assignment.get_assignment_table @year, @week
  end
end

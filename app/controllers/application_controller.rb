class ApplicationController < ActionController::Base
  protect_from_forgery
  
  respond_to :html, :json

  def index
    @workers = Worker.get_available_days params[:year], params[:week]
    @projects = Project.get_work_days params[:year], params[:week]
    @assignments = Assignment.get_assigned_days_per_worker params[:year], params[:week]
    respond_with :workers => @workers, :projects => @projects, :assignments => @assignments
    #render :text => "year: #{params[:year]}, week: #{params[:week]}"
  end
end

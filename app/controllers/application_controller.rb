class ApplicationController < ActionController::Base
  protect_from_forgery
  
  respond_to :html, :json

  def abbr
    abbr = params[:abbr]
    date = DateTime.now

    date = date + 1.week if abbr=='next'
    date = date - 1.week if abbr=='last'

    redirect_to date_path :week => date.cweek, :year => date.year, :format => params[:format]
  end

  def date
    @year = params[:year]
    @week = params[:week]
    @workers = Worker.all
    @projects = Project.all
    @assignment_days = Assignment.get_assignment_days @year, @week
    @assignments = Assignment.get_assignments @year, @week
  end
end

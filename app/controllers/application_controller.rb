class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render :text => "year: #{params[:year]}, week: #{params[:week]}"
  end
end

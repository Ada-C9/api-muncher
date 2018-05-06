class ApplicationController < ActionController::Base
  before_action :find_user
  before_action :save_recent_searches

  private

  def find_user
    if session[:user_id]
      @logged_user = User.find_by(id: session[:user_id])
    end
  end

  private
  def save_recent_searches
    session[:recent_searches] = [] if session[:recent_searches].nil?
  end
end

class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login

  def current_user
    @login_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:status] = :failure
      flash[:result_text] = "You must log in to see this content"
      redirect_back fallback_location: root_path
    end
  end
  
end

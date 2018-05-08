class ApplicationController < ActionController::Base

  def require_user_log_in
    if session[:user_id].nil?
      flash[:status] = :error
      flash[:login_required] = "Please log in for access to details of recipes."
      redirect_to root_path
    end
  end
end

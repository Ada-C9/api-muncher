class SessionsController < ApplicationController

  before_action :check_if_logged_in, only: [:create]

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']
      user = User.build_from_google(auth_hash)

      if user.nil?
        flash[:status] = :failure
        flash[:message] = 'Not able to log in'
        redirect_to root_path
        return
      end

      session[:user_id] = user.id
      flash[:status] = :success
      flash[:message] = 'Successfully logged in'
      redirect_to user_path(user.id)
      return
    else
      flash[:status] = :failure
      flash[:message] = 'Not able to log in'
      redirect_to root_path
    end
  end


  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:status] = :success
      flash[:message] = 'Successfully logged out'
    else
      flash[:status] = :failure
      flash[:message] = 'Not logged in'
    end
    redirect_to root_path
  end

  private

  def check_if_logged_in
    if session[:user_id]
      flash[:status] = :failure
      flash[:message] = 'Already logged in'

      redirect_back(fallback_location: user_path(session[:user_id]))
    end
  end
end

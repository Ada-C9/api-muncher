class SessionsController < ApplicationController

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
    session[:user_id] = nil
    flash[:status] = :success
    flash[:message] = 'Successfully logged out'
  end
end

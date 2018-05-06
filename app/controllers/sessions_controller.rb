class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']
      

    else
      flash[:status] = :error
      flash[:message] = 'Not able to log in'
      redirect_to root_path
    end
  end

end

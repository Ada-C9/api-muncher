class SessionsController < ApplicationController
    before_action :require_user_log_in, only: [:destroy]
  def create
  auth_hash = request.env['omniauth.auth']
  if auth_hash['uid']
    @user = User.find_by(uid: auth_hash['uid'])
    if @user.nil?
      create_new_user
    else
      flash[:status] = :success
      flash[:message] = "Logged in successfully, welcome back #{@user.username}"
    end
    session[:user_id] = @user.id
  else
    flash[:status] = :failure
    flash[:message] = "Log in has failed"
  end
    redirect_to query_results_path
 end

  def destroy
    session[:user_id] = nil
    flash[:status] = :success
    flash[:message] = "You've logged out"
    redirect_to query_results_path
  end


  private
  def create_new_user
      auth_hash = request.env['omniauth.auth']
      @user = User.new(username: auth_hash['info']['nickname'], email: auth_hash['info']['email'], uid: auth_hash['uid'])
      if @user.save
        flash[:status] = :success
        flash[:message] = "Your account has been generated #{@user.username}!"
      else
        flash[:status] = :failure
        flash[:message] = "Something has gone wrong in the account generation process."
      end
  end



end

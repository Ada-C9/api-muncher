class SessionsController < ApplicationController
  def create
  auth_hash = request.env['omniauth.auth']
  if auth_hash['uid']
    @user = User.find_by(uid: auth_hash['uid'])
    if @user.nil?
      create_new_user
    else
      flash[:status] = :success
      flash[:result_text] = "Logged in successfully, welcome back #{@user.username}"
    end
    session[:user_id] = @user.id
  else
    flash[:status] = :failure
    flash[:result_text] = "Log in has failed"
  end
    redirect_to query_results_path
 end

  def destroy
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "You've logged out"
    redirect_to query_results_path
  end


  private
  def create_new_user
      auth_hash = request.env['omniauth.auth']
      @user = User.new(username: auth_hash['info']['nickname'], email: auth_hash['info']['email'], uid: auth_hash['uid'])
      if @user.save
        flash[:status] = :success
        flash[:result_text] = "Your account has been generated #{@user.username}!"
      else
        flash[:status] = :failure
        flash[:result_text] = "Something has gone wrong in the account generation process."
      end
  end



end

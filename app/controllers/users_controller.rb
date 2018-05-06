class UsersController < ApplicationController

  def show; end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :email)
  end

end

class UsersController < ApplicationController

  def show
    redirect_back(fallback_location: root_path) unless @logged_user

    @favorites = @logged_user.favorites
  end

end

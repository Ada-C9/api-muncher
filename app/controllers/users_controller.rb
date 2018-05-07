class UsersController < ApplicationController

  def show
    unless @logged_user
      redirect_back(fallback_location: root_path)
      return
    end

    @favorites = @logged_user.favorites
  end

end

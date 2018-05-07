class FavoritesController < ApplicationController

  def create
    if @logged_user
      favorite = Favorite.new(user_id: @logged_user.id)
    else
      flash[:status] = :failure
      flash[:message] = 'You must be logged in to do that'
      redirect_to root_path
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:name, :uri, :image)
  end
end

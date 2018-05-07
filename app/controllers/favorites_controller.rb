class FavoritesController < ApplicationController

  def create
    if @logged_user
      favorite = Favorite.new(favorite_params)
      favorite.user = @logged_user
      
      if favorite.save
        flash[:status] = :success
        flash[:message] = 'Successfully added favorite'
        return
      else
        flash[:status] = :failure
        flash[:message] = 'You must be logged in to do that'
        redirect_to root_path
        return
      end
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

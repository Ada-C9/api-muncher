class FavoritesController < ApplicationController

  def create
    if @logged_user
      favorite = Favorite.new(
        uri: params[:uri],
        name: params[:name],
        image: params[:image],
        user_id: @logged_user.id
      )

      if favorite.save
        flash.now[:status] = :success
        flash.now[:message] = 'Successfully added favorite'
        return
      else
        flash[:status] = :failure
        if favorite.errors.messages[:uri]
          flash[:message] = 'You have alredy favorited this recipe'
        else
          flash[:message] = 'Unable to favorite'
        end
        redirect_to root_path
        return
      end
    else
      flash[:status] = :failure
      flash[:message] = 'You must be logged in to do that'
      redirect_to root_path
    end
  end
end

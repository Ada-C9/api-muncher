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
        flash[:status] = :success
        flash[:message] = 'Successfully added favorite'
        redirect_back(fallback_location: root_path)
        return
      else
        flash[:status] = :failure
        if favorite.errors.messages[:uri]
          flash[:message] = 'You have alredy favorited this recipe'
          redirect_back(fallback_location: root_path)
          return
        else
          flash[:message] = 'Unable to favorite'
          redirect_to root_path
          return
        end
      end
    else
      flash[:status] = :failure
      flash[:message] = 'You must be logged in to do that'
      redirect_to root_path
    end
  end
end

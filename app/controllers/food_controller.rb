class FoodController < ApplicationController
  # around_action :catch_api_error

  def index
    @recipes = params[:recipe]
  end

  def new
    @recipe_search = params[:recipe]
  end

  def show
    @recipe = params[:recipe]
  end

  def create
    @recipe_search = params[:recipe]

    EdamamApiWrapper.recipe_list(@recipe_search)
    flash[:status] = :success
    flash.now[:message] = "Here is a list of recipes for #{@recipe_search}"
    render :index
  end

end

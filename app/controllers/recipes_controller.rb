class RecipesController < ApplicationController
  # around_action :catch_api_error

  def index
    @recipes = EdamamApiWrapper.recipe_list(params[:recipe])
  end

  def new
    @recipe_search = params[:recipe]
  end

  def show
    @recipe = params[:recipe]
  end
end

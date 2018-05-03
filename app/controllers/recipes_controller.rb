class RecipesController < ApplicationController

  def root
  end

  def index
    @query = params[:query]
    @recipes = MuncherApiWrapper.get_recipes(@query, params[:page])
  end

  def show
    recipe_uri = params[:uri]
    @recipe = MuncherApiWrapper.get_one_recipe(recipe_uri)
  end

end

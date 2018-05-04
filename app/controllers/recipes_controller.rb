class RecipesController < ApplicationController

  def home
  end

  def index
    @recipes = ApiMuncherWrapper.search_recipes(params[:search])
  end

  def show
    recipe_id = params[:id]
    @recipe = ApiMuncherWrapper.find_recipe(recipe_id)
    if recipe.nil?
      flash[:alert] = "Invalid recipe"
    else
      @recipe = recipe
    end
  end
end

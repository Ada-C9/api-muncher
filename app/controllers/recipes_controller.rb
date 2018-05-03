class RecipesController < ApplicationController

  def home
  end

  def index
    @recipes = ApiMuncherWrapper.search_recipes(params[:search])
  end

  def show
    @recipe = ApiMuncherWrapper.find_recipes(params[:uri])
    if recipe.nil?
      flash[:alert] = "Recipe doesn't exist"
      redirect_back(fallback_location: root_path)
    else
      @recipe
    end
  end
end

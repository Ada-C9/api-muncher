class RecipesController < ApplicationController

  def home
  end

  def index
    @recipes = ApiMuncherWrapper.search_recipes(params[:search]).paginate(:page => params[:page],:per_page => 10)
  end


  def show
    recipe_id = params[:id]
    @recipe = ApiMuncherWrapper.find_recipe(recipe_id)

    if @recipe.nil?
      flash[:alert] = "Invalid recipe"
      redirect_to recipes_path
    else
      @recipe
    end

  end
end

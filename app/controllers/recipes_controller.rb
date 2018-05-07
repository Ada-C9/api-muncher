class RecipesController < ApplicationController

  def home
  end

  def index
    @query = params[:search]
    @recipes = EdamamApiWrapper.list_recipes(@query).paginate(:page => params[:page], :per_page => 10)

  end

  def show
    recipe_id = params[:id]
    recipe = EdamamApiWrapper.find_recipe(recipe_id)
    if recipe.nil?
      flash[:alert] = "Recipe does not exist"
      redirect_back(fallback_location: root_path)
    else
      @recipe = recipe
    end
  end
end

class RecipesController < ApplicationController

  def root
  end

  def index
    @query = params[:search]
    @recipes = EdamamApiWrapper.list_recipes(@query)
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
    if @recipe.nil?
      flash[:alert] = "That recipe does not exist"
      redirect_back fallback_location: recipes_path
    end
  end
end

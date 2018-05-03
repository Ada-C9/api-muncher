class RecipesController < ApplicationController

  def index
    search_term = params[:search]
    @recipes = EdamamApiWrapper.list_recipes(search_term)
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

end

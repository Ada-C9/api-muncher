class RecipesController < ApplicationController
  def index
    @recipes = RecipeApiWrapper.list_recipes
  end

  def show
    # @recipe = params[:recipe]
  end

end

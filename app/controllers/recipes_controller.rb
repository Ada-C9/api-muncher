class RecipesController < ApplicationController
  def index
    @recipes = RecipeSearchWrapper.search_recipes
  end

end

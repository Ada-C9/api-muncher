class RecipesController < ApplicationController
  def index
    @recipes = RecipeApiWrapper.list_recipes
    # @recipe = RecipeApiWrapper.show_recipe("http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_48c52ac3bd8c16720a7cb8ef34cd5e5b")
  end

  def show
    # @recipe = params[:recipe]
  end

end

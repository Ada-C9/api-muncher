class RecipesController < ApplicationController
  def index
    @recipes = RecipeApiWrapper.list_recipes
    @recipe = RecipeApiWrapper.show_recipe("http://www.edamam.com/ontologies/edamam.owl#recipe_48c52ac3bd8c16720a7cb8ef34cd5e5b")
  end

  def show
    # @recipe = params[:recipe]
  end

end

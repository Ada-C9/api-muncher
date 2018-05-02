class RecipesController < ApplicationController
  def index
    @recipes = EdmamApiWrapper.list_recipes
  end

  def show
  end
end

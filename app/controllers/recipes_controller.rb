class RecipesController < ApplicationController

  def root

  end

  def index
    @term = params[:query]
    @recipes = EdamamApiWrapper.find_recipes(@term)
  end

  def show
    # raise
    @recipe = EdamamApiWrapper.find(params[:id])
  end
end

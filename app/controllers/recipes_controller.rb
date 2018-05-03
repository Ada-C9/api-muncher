class RecipesController < ApplicationController
  def search
  end

  def index
    query = params[:query]
    @recipes = EdamamApiWrapper.search_results(query)
  end

  def show
    id = params[:id]
    @recipe = EdamamApiWrapper.recipe_details(id)
  end
end

class RecipesController < ApplicationController

  def search; end

  def index
    query = params[:query]
    search = EdamamApiWrapper.search(query)
    @recipes = search.recipes
  end

  def show

  end

end

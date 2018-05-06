
class RecipesController < ApplicationController

  def index
    @term = params[:query]
    search = EdamamApiWrapper.find_recipes(@term)
    @recipes = search.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    not_found unless @recipe = EdamamApiWrapper.find(params[:id])
  end
end

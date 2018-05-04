
class RecipesController < ApplicationController

  def root

  end

  def index
    @term = params[:query]
    search = EdamamApiWrapper.find_recipes(@term)
    @recipes = search.paginate(:page => params[:page], :per_page => 10)
    # raise

  end

  def show
    # raise
    @recipe = EdamamApiWrapper.find(params[:id])
  end
end

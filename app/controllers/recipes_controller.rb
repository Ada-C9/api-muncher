
class RecipesController < ApplicationController

  def root

  end

  def index
    @term = params[:query]
    @recipes = EdamamApiWrapper.find_recipes(@term).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    # raise
    @recipe = EdamamApiWrapper.find(params[:id])
  end
end

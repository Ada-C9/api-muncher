class RecipesController < ApplicationController

  def root
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

end

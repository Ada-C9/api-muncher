
class RecipesController < ApplicationController
  def homepage;
  end

  def index
    @recipes = EdemamApiWrapper.list_recipes(params[:flavor]).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdemamApiWrapper.find_recipe(params[:recipe_uri])
  end

end

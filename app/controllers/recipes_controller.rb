
class RecipesController < ApplicationController
  def homepage;
  end

  def index
    @recipes = EdemamApiWrapper.list_recipes(params[:flavor]).paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @recipe = EdemamApiWrapper.find_recipe(params[:recipe_uri])
  end

  def search
    flavor = params[:flavor]
    @recipes = EdemamApiWrapper.list_recipes(flavor)

    redirect_to recipes_path(flavor)
  end
end

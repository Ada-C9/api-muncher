class RecipesController < ApplicationController

  def home
  end

  def index
    @query = params[:search]
    @recipes = EdamamApiWrapper.list_recipes(@query)
  end

  def new
  end

  def create
  end

  def show
    recipe_id = params[:id]
    @recipe = EdamamApiWrapper.find_recipe(recipe_id)
  end
end

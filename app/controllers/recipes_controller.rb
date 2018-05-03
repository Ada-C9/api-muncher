class RecipesController < ApplicationController

  def root
  end

  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:q])
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

end

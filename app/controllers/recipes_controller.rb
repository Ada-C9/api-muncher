class RecipesController < ApplicationController

  def index
    terms = search_params["terms"]
    @recipe_list = MuncherApiWrapper.list_recipes(terms)
  end

  def show
    recipe = recipe_params["id"]
    @recipe = MuncherApiWrapper.show_recipe(recipe)
  end

  def search
  end

  private

  def search_params
    params.require(:search)
  end

  def recipe_params
    params.require(:id)
  end

end

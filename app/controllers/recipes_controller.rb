class RecipesController < ApplicationController

  def index
    terms = search_params["terms"]
    @recipe_list = MuncherApiWrapper.list_recipes(terms)
  end

  def show
  end

  def search
  end

  private

  def search_params
    params.require(:search)
  end

end

class RecipesController < ApplicationController

  def index
    terms = search_params["terms"]
    list = MuncherApiWrapper.list_recipes(terms)
    x = MuncherApiWrapper.list_recipes(terms).uniq
    @recipe_list = list.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    id = recipe_id
    @recipe = MuncherApiWrapper.show_recipe(id)
  end

  def search
  end

  private

  def search_params
    params.require(:search)
  end

  def recipe_id
    params.require("id")
  end

end

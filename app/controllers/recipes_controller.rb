require_relative "../../lib/muncher_api_wrapper.rb"

class RecipesController < ApplicationController

  def search; end

  def index
    terms = search_params["terms"]
    list = ::MuncherApiWrapper.list_recipes(terms)
    @recipe_list = list.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    id = recipe_id
    recipe = ::MuncherApiWrapper.show_recipe(id)

    if recipe.nil?
      flash[:notice] = "Something went wrong. Please enter a new search."
      redirect_to search_path
    else
      @recipe = recipe
    end
  end

  private

  def search_params
    params.require(:search)
  end

  def recipe_id
    params.require("id")
  end

end

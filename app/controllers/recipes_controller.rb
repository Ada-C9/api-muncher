# require_relative '../../lib/edemam_api_wrapper.rb'
class RecipesController < ApplicationController
  def new

  end

  def index
    search_term = params[:q]
    @results = EdemamApiWrapper.list_recipes(search_term)
  end

  def show
    id = params[:id]
    @recipe = EdemamApiWrapper.show_recipe(id)
  end
end

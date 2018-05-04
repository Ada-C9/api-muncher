require 'edamam_api_wrapper.rb'

class RecipesController < ApplicationController

  def index
    api_search = EdamamApiWrapper.list_all_recipes(params[:search])
    @recipes = Kaminari.paginate_array(api_search).page(params[:page]).per(8)
  end

  def show
    uri = params[:uri]
  end

end

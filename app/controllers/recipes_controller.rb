require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'

class RecipesController < ApplicationController

  def index
    @term = params[:query]
    search = EdamamApiWrapper.find_recipes(@term)
    @recipes = search.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.find(params[:id])

    if @recipe.nil?
      flash[:alert] = "Invalid recipe."
      redirect_back(fallback_location: root_path)
    else
      @recipe
    end

  end
end

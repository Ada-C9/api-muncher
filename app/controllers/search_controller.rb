class SearchController < ApplicationController

  def new
  end

  def index
    @search_terms = params[:search_terms]
    @recipes = RecipeApiWrapper.find_recipes(@search_terms).paginate(page: params[:page], per_page: 10)
  end

  def show
    id = params[:id]
    @recipe = RecipeApiWrapper.get_recipe(id)
    if @recipe.nil?
      flash[:alert] = "Recipe does not exist"
      redirect_back(fallback_location: root_path)
    end
  end

end

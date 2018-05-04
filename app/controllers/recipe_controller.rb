class RecipeController < ApplicationController
  def root
  end

  def index
    @search_terms = params[:search_terms]
    @range = params[:range]
    if @range
      recipe_search = EdamamApiWrapper.list_recipes(@search_terms, @range)
    else
      recipe_search = EdamamApiWrapper.list_recipes(@search_terms)
    end
    @recipes = recipe_search[:recipe_list]
    @more = recipe_search[:more]
  end

  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.return_recipe(uri)
  end
end

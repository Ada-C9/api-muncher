class RecipeController < ApplicationController
  def root
  end

  def index
    @search_terms = params[:search_terms]
    @start_index = params[:start_index]
    if @start_index
      recipe_search = EdamamApiWrapper.list_recipes(@search_terms, @start_index)
    else
      recipe_search = EdamamApiWrapper.list_recipes(@search_terms)
    end
    @recipes = recipe_search[:recipe_list]
    @page_count = recipe_search[:page_count]
  end

  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.return_recipe(uri)
  end
end

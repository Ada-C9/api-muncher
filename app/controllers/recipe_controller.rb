class RecipeController < ApplicationController
  def root
  end

  def index
    @search_terms = params[:search_terms]
    @recipes = EdamamApiWrapper.list_recipes(@search_terms)
  end

  def show
    @recipe = params[:recipe]
  end
end

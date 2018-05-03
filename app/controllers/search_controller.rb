class SearchController < ApplicationController


  def new
  end

  def index
    @search_terms = params[:search_terms]
    @recipes = RecipeApiWrapper.find_recipes(params[:search_terms])
  end

  def show
  end
end

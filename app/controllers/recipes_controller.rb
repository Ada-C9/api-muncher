class RecipesController < ApplicationController
  def home
  end

  def index
    if params[:term]
      @recipes = EdamamApiWrapper.list_recipes(params[:term])
      session[:term] = params[:term]
    else
      flash[:status] = :failure
      flash[:result_text] = "Search failed"
    end
  end

  def show
    if params[:recipe_id]
      @recipe = EdamamApiWrapper.find_recipe(params[:recipe_id])
    end
  end

end

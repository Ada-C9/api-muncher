class RecipesController < ApplicationController
  def home
  end

  def index
    if params[:term]
      if params[:page_num]
        @recipes = EdamamApiWrapper.list_recipes(params[:term], params[:page_num])
        session[:term] = params[:term]
      else
        @recipes = EdamamApiWrapper.list_recipes(params[:term], 1)
        session[:term] = params[:term]
      end
    else
      flash[:status] = :failure
      flash[:result_text] = "Searching failed"
    end
  end

  def show
    if params[:recipe_id]
      @recipe = EdamamApiWrapper.find_recipe(params[:recipe_id])
    else
      flash[:status] = :failure
      flash[:result_text] = "Invalid recipe ID was provided"
    end
  end

end

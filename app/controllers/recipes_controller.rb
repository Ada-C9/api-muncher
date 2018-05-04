class RecipesController < ApplicationController

  def home
  end

  def index
    if params[:term] && params[:term].strip.length > 0
      if params[:page_num]
        @recipes = EdamamApiWrapper.list_recipes(params[:term], params[:page_num])
        session[:term] = params[:term]
      else
        @recipes = EdamamApiWrapper.list_recipes(params[:term], 1)
        session[:term] = params[:term]
      end
    else
      flash[:status] = :failure
      flash[:result_text] = "Please enter a valid term for searching"
      redirect_back fallback_location: root_path
    end
  end

  def show
    if params[:recipe_id] && params[:recipe_id].length == 32
      @recipe = EdamamApiWrapper.find_recipe(params[:recipe_id])
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not find that recipe"
      redirect_to recipes_path
    end
  end

end

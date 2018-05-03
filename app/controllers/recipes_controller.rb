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
      flash.now[:status] = :failure
      flash.now[:result_text] = "Please enter a valid term for searching"
      render :home, status: :bad_request
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

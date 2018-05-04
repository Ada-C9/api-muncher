
class RecipesController < ApplicationController
  def homepage;
  end

  def index
    @recipes = EdemamApiWrapper.list_recipes(params[:flavor]).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    begin
      @recipe = EdemamApiWrapper.find_recipe(params[:recipe_uri])
    rescue EdemamApiWrapper::EdemamError => error
      redirect_back fallback_location: homepage_path
      flash[:status] = :failure
      flash[:error] = error.message
    end
  end

end

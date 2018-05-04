class RecipesController < ApplicationController
  # around_action :catch_api_error

  def index
    if params[:search]

      #returns all recipes for GET request from API
      @recipes = EdamamApiWrapper.list_recipes(params[:search])
    end
  end

def show
 @recipe = EdamamApiWrapper.recipe_show(params[:uri])
end



  private
  def catch_api_error
    begin

      yield
    rescue EdamamApiWrapper::EdamamError => error
      flash[:status] = :failure
      flash[:message] = "API called failed #{error}"
      redirect_back fallback_location: root_path
    end
  end
end

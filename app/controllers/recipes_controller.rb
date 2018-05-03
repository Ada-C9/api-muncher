class RecipesController < ApplicationController
  # around_action :catch_api_error

  def index
    #returns all recipes for GET request from API
    @recipes = EdamamApiWrapper.list_recipes
  end

  def new
    #takes in a parameter for a new search and sends that to API
    @recipe_search = params[:search]
  end

  def create
    search = params[:search]

    EdamamApiWrapper.list_recipes(search)

    flash[:status] = :success
    flash[:message] = "Searching recipes now....."
    redirect_to root_path 


  private
  # def catch_api_error
  #   begin
  #
  #     yield
  #   rescue EdamamApiWrapper::EdamamError
  #   => error
  #     flash[:status] = :failure
  #     flash[:message] = "API called failed #{error}"
  #     redirect_back fallback_location: root_path
  #   end
  end
end

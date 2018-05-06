class RecipesController < ApplicationController

  def new
    #This is for the front page search
    # @recipe = params[:recipe]
  end

  def search

  end

  def index
    query = params[:query]
    @recipes = EdamamApiWrapper.recipe_search_result(query)
    if !@recipes
      flash[:status] = :failure
      flash[:result_text] = "No recipes match your search"
      flash[:messages] = @user.errors.messages
    else
      flash[:status] = :success
    end
  end

  def detail
    target_uri = params[:uri_wanted]
    @target_recipe = EdamamApiWrapper.specific_recipe(target_uri)
  end
end

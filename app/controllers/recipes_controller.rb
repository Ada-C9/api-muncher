require 'will_paginate/array'

class RecipesController < ApplicationController
  around_action :catch_api_error

  def homepage; end

  def index
    @recipes = RecipeApiWrapper.list_recipes(params[:ingredient]).paginate(:page => params[:page], :per_page => 12)
  end

  def show
    recipe_id = params[:uri]

    @recipe = RecipeApiWrapper.show_recipe(recipe_id)
  end

  private
  def catch_api_error
    begin
      # This will run the actual controller action
      # Actually the same yield keyword as in
      # application.html.erb
      yield
    rescue RecipeApiWrapper::RecipeError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: invalid input. Please try again."
      redirect_back fallback_location: root_path
    end
  end

end

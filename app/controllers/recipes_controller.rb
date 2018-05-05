require 'will_paginate/array'

class RecipesController < ApplicationController
  around_action :catch_api_error

  def homepage; end

  def index
    @recipes = RecipeApiWrapper.list_recipes(params[:ingredient]).paginate(:page => params[:page], :per_page => 12)
    # add pagenation here
  end

  def show
    recipe_id = params[:uri]

    @recipe = RecipeApiWrapper.show_recipe(recipe_id)
  end

  # def search
  #   ingredient = params[:ingredient]
  #
  #   redirect_to recipes_path(ingredient)
  # end

  private
  def catch_api_error
    begin
      # This will run the actual controller action
      # Actually the same yield keyword as in
      # application.html.erb
      yield
    rescue RecipeApiWrapper::RecipeError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end

end

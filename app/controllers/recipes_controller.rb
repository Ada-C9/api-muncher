require 'will_paginate/array'

class RecipesController < ApplicationController

  def home; end

  def index
    @query = params[:query]

    if @query == "" || @query == nil
      flash[:status] = :failure
      flash[:message] = "Please enter the name of a recipe."
      redirect_back(fallback_location: root_path)
    else
      recipes = EdamamWrapper.search_recipes(@query)
      @recipes = recipes.paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    id = params[:id]
    begin
      @recipe = EdamamWrapper.get_recipe(id)
    rescue StandardError
      flash[:status] = :failure
      flash[:message] = "Unable to retrieve your recipe."
      redirect_to root_path
    end
  end
end

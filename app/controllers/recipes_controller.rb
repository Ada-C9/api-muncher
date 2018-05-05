require 'will_paginate/array'

class RecipesController < ApplicationController

  def index
    @query = params[:query]

    if @query == ""
      flash[:status] = :error
      flash[:message] = "Please enter the name of a recipe."
    else
      recipes = EdamamWrapper.search_recipes(@query)
      @recipes = recipes.paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    id = params[:id]
    if id
      @recipe = EdamamWrapper.get_recipe(id)
      puts "executed get_recipe method"
    else
      flash[:status] = :error
      flash[:message] = "Unable to retrieve your recipe."
    end
  end
end

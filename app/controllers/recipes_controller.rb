require 'will_paginate/array'

class RecipesController < ApplicationController

def homepage
end

  def index
    #@count,
    @recipes = EdamamApiWrapper.recipe_list(params[:query], 10).paginate(:page => params[:page], :per_page => 5)
    #@recipes = @recipes
  end

  def show

    @recipe = EdamamApiWrapper.one_recipe(params[:id])

  end
end

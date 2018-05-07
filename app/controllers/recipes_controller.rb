require 'will_paginate/array'

class RecipesController < ApplicationController

def homepage
end

  def index
    #@count,
    @recipes = EdamamApiWrapper.recipe_list(params[:query]).paginate(:page => params[:page], :per_page => 10, :total_entries => 100)
    #@recipes = @recipes
  end

  def show

    @recipe = EdamamApiWrapper.one_recipe(params[:id])

  end
end

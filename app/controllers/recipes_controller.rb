require 'will_paginate/array'
class RecipesController < ApplicationController

  def index
    if params[:q]

      @recipes = EdamamApiWrapper.list_recipes(params[:q])
    @recipe =  @recipes.paginate(:page => params[:page], :per_page => 5)

    else
      redirect_to recipes_path
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:r])
  end


end

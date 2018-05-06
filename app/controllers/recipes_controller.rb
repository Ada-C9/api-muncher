require 'httparty'
# require_dependency '../../lib/muncher_wrapper'
# require_dependency '../../lib/recipe'
 require 'will_paginate/array'


class RecipesController < ApplicationController
  def root
  end

  def index
    @query = params[:search_phrase]
    recipes = MuncherWrapper.get_recipes(@query)
    @recipes = recipes.paginate(:page => params[:page], :per_page => 12)

    if @recipes.empty?
      flash[:status] = :failure
      flash[:message] = "No recipes found. Please try again."
      redirect_to root_path
    end


  end

  def show
    @recipe = MuncherWrapper.show_recipe(params[:uri])

    # if @recipe.empty?
    #   flash[:status] = :failure
    #   flash[:message] = "Recipe does not exist. Please try again."
    #   redirect_to root_path
    # end

  end

  def new
  end

end

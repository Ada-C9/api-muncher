require 'will_paginate/array'


class RecipesController < ApplicationController

  def search
  end

  def index
    @query = params[:query]
    @recipes = ( EdamamApiWrapper.recipe_search_result(@query)).paginate(page: params[:page], per_page: 10)
    if !@recipes
      flash[:status] = :failure
      flash[:result_text] = "The raw power of your search has caused this app to fail."
      flash[:messages] = @recipes.errors.messages
    elsif @recipes.count == 0
      flash[:status] = :failure
      flash[:result_text] = "Your chosen foodstuff is too mëtäl for this app and has returned zero search results."
    else
      flash[:status] = :success
    end
  end

  def detail
    target_uri = params[:uri_wanted]
    @target_recipe = EdamamApiWrapper.specific_recipe(target_uri)
    if @target_recipe
      flash[:status] = :success
    else
      flash[:status] = :failure
      flash[:result_text] = "We cannot display that recipe because it requires geometries from beyond this universe and therefore would reduce every living being on this planet to gibbering madness. We apologize for any inconvenience."
      redirect_to root_path
    end
  end
end

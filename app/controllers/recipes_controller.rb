require 'will_paginate/array'


class RecipesController < ApplicationController

  def search
  end

  def index
    @query = params[:query]
    @recipes = ( EdamamApiWrapper.recipe_search_result(@query)).paginate(page: params[:page], per_page: 10)
    if !@recipes
      flash[:status] = :failure
      flash[:result_text] = "No recipes match your search"
      flash[:messages] = @recipes.errors.messages
    else
      flash[:status] = :success
    end
  end

  def detail
    target_uri = params[:uri_wanted]
    @target_recipe = EdamamApiWrapper.specific_recipe(target_uri)
  end
end

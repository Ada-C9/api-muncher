require 'will_paginate/array'

class RecipesController < ApplicationController
  def search; end

  def index
    query = params[:query]
    @recipes = EdamamApiWrapper.search_results(query).paginate(page: params[:page], per_page: 12)
  end

  def show
    id = params[:id]
    @recipe = EdamamApiWrapper.recipe_details(id)
  end
end

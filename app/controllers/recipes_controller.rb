require 'EdamamWrapper'
require 'will_paginate/array'

class RecipesController < ApplicationController

  def index
    query = params[:query]

    if query
      recipes = EdamamWrapper.search_recipes(query)
      @recipes = recipes.paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    uri = params[:uri]
    @recipe = EdamamWrapper.get_recipe(uri)
  end
end

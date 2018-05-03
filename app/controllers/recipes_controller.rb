require 'EdamamWrapper'

class RecipesController < ApplicationController

  def index
    query = params[:query]

    if query
      @recipes = EdamamWrapper.search_recipes(query)
    end
  end

  def show

  end



end

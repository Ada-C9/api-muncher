require 'pry'

class RecipesController < ApplicationController

  def root
  end

  def index
    @query = params[:search]
    search = @query
    params[:first] ? @first = params[:first] : @first = "0"

    @recipes = EdamamApiWrapper.get_recipes(search, @first)
  end

  def show
    id = params[:id]
    @recipe = EdamamApiWrapper.show_recipe(id)
  end
end

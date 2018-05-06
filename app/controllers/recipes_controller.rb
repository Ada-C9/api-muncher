class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.list_recipes
  end

  # def show
  #   @recipe =
  # end

  def new; end

  def create # this is for searching

  end

end

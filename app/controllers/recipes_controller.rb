class RecipesController < ApplicationController

  def root

  end

  def index
    @recipes = EdamamApiWrapper.find_recipes("chicken")
  end

  def new
  end

  def create
  end
end

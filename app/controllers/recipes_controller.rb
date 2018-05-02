class RecipesController < ApplicationController

  def root

  end

  def index
    @recipes = EdamamApiWrapper.find_recipes(params[:query])
  end

  # def new
  # end
  #
  # def create
  # end
end

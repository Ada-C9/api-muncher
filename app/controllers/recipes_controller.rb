class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.list_all_recipes(params[:search])
  end

  def create

  end

end

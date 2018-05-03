class RecipesController < ApplicationController

  def homepage

  end

  def index
    @recipes = EdamamApiWrapper.list_all_recipes(params[:text])
  end

  def create

  end

end

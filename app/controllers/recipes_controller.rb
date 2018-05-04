class RecipesController < ApplicationController
  def search
    recipes = MuncherApiWrapper.search_recipes(params[:search_term])
  end

  def index
  end

  def show
  end

end

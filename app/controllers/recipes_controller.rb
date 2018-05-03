class RecipesController < ApplicationController

  def home
  end

  def index
    @recipes = ApiMuncherWrapper.search_recipes(params[:search])
  end

  def show
    @recipe = ApiMuncherWrapper.find_recipes(params[:uri])
  end
end

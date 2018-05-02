class RecipesController < ApplicationController
  def index
    @recipes = MuncherWrapper.get_recipes
  end

  def show
  end
end

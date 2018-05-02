class RecipesController < ApplicationController
  def root
  end

  def index
    @recipes = MuncherWrapper.get_recipes#(search_phrase)
  end

  def show
  end

  def new
  end

end

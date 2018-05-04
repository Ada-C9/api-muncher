require 'httparty'


class RecipesController < ApplicationController
  def root
  end

  def index
    @query = params[:search_phrase]
    @recipes = MuncherWrapper.get_recipes(@query)

  end

  def show
    @recipe = MuncherWrapper.show_recipe(params[:uri])
  end

  def new
  end

end

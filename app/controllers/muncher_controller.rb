class MuncherController < ApplicationController

  def search
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search])
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe()
  end

end

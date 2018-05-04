class MuncherController < ApplicationController

  def search
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:id])
  end

end

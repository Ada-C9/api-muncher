class RecipesController < ApplicationController
  def main
  end

  def index
    @recipes = MuncherApiWrapper.list_recipes(params[:message])
  end

  def show
    
  end
end

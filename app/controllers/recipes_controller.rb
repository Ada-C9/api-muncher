class RecipesController < ApplicationController

  def root
  end

  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:q])
  end

  def show
    begin
      @recipe = EdamamApiWrapper.show_recipe(params[:id])
    rescue ArgumentError => error
      redirect_to root_path
    end
  end

end

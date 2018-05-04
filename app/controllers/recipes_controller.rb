class RecipesController < ApplicationController

  def root
  end

  def index
    @query = params[:search]
    @recipes = EdamamApiWrapper.get_recipes(@query).paginate(page: params[:page], per_page: 10)
  end

  def show
    id = params[:id]
    @recipe = EdamamApiWrapper.show_recipe(id)
  end
end

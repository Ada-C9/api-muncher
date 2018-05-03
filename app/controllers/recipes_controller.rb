class RecipesController < ApplicationController

def homepage
end

  def index
    @recipes = EdamamApiWrapper.recipe_list(params[:query])
  end

  def show

    @recipe = EdamamApiWrapper.one_recipe(params[:id])

  end
end

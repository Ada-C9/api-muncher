class RecipesController < ApplicationController
  def root

  end

  def list
    # text entered into search form
    @search = params[:search]

    # call self method in api wrapper
    @recipes = RecipeSearchWrapper.list_recipes(@search)
  end

  def show
  end
end

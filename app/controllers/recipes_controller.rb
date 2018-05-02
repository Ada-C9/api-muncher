class RecipesController < ApplicationController
  def root
  end

  def list
    @search = params[:search]

    @recipes = RecipeSearchWrapper.list_recipes(@search)
    if @recipes == []
      # flash message that message was not found
      # redirect to root/search
    end
  end

  def show
    id = params[:id]
    @recipe = RecipeSearchWrapper.find_recipe(id)
  end
end

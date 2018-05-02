class RecipesController < ApplicationController
  def root
  end

  def list
    @search = params[:search]

    @recipes = RecipeSearchWrapper.list_recipes(@search)
    if @recipes == []
      flash[:status] = :alert
      flash[:result] = "There are zero search results for: \'#{@search}\'"
      render :root
    end
  end

  def show
    id = params[:id]
    @recipe = RecipeSearchWrapper.find_recipe(id)
  end
end

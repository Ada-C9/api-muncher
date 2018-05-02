class RecipesController < ApplicationController
  def root
  end

  def list
    @search = params[:search]

    @recipes = RecipeSearchWrapper.list_recipes(@search)
    if @recipes == []
      flash[:status] = :alert
      flash[:result] = "There are zero search results for: \'#{@search}\'"
      redirect_to root_path
    end
  end

  def show
    id = params[:id]
    @recipe = RecipeSearchWrapper.find_recipe(id)
    if @recipe.nil?
      flash[:status] = :alert
      flash[:result] = "Recipe not found"
      redirect_to search_results_path
    end
  end
end

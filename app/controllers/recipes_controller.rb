class RecipesController < ApplicationController

  def root
  end

  def index
    @query = params[:search]
    @recipes = EdamamApiWrapper.get_recipes(@query).paginate(page: params[:page], per_page: 10)
  end

  def show
    id = params[:id]
    chosen_recipe = EdamamApiWrapper.show_recipe(id)
    if chosen_recipe.nil?
      redirect_to root_path
    else
      @recipe = chosen_recipe
    end
  end
end

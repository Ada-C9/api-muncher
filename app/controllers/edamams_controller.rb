class EdamamsController < ApplicationController

  def index
    recipe_list = RecipeApiWrapper.recipes(params[:recipe])
    @recipe_list = Kaminari.paginate_array(recipe_list).page(params[:page]).per(10)
  end

  def new
    @search_for = params[:recipe]
  end

  def show
    @recipe = RecipeApiWrapper.single_recipe(params[:uri])
  end
end

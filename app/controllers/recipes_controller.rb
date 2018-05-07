class RecipesController < ApplicationController

  def new; end #root

  def index
    recipes = EdamamApiWrapper.list_recipes(params[:query])

    @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(12)

  end

  def show
    @recipe = EdamamApiWrapper.display_recipe(params[:uri])
  end

end

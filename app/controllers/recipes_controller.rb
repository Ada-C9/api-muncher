class RecipesController < ApplicationController

  def index
    recipes = EdamamApiWrapper.list_recipes(params[:query])

    @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(12)

  end

  def new; end

  def create
    @recipe = EdamamApiWrapper.display_recipe(params[:uri])
    redirect_to :show
  end

  def show
    # @recipe =
  end

end

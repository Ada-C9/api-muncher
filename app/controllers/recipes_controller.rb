class RecipesController < ApplicationController
  def main
  end

  def index
    recipes = MuncherApiWrapper.list_recipes(params[:message])
    @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(12)
  end

  def show
    @recipe = MuncherApiWrapper.show(params[:uri])
  end
end

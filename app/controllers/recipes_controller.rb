class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:query])
  end

  def new; end

  def create
    @recipe = EdamamApiWrapper.display_recipe(params[:uri])
    redirect_to :show
  end

  # def show
  #   @recipe =
  # end

end

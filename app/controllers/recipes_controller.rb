class RecipesController < ApplicationController

  def root
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search])
    # if @recipes.count < 1
    #   flash[:error] = "No recipes available for that search. Please try again!"
    # end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :title, :image, :link, :source, :ingredients, :dietlabels)
  end

end

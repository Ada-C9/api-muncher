class RecipesController < ApplicationController

  def root
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search]).paginate(:page => params[:page], :per_page => 10)

    # if @recipes.count < 1
    #   flash[:error] = "No recipes available for that search. Please try again!"
    # end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

end

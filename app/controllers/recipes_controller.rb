class RecipesController < ApplicationController

  def index
    if params[:q]
      #@recipes.paginate(:page => params[:page], :per_page => 30)
      @recipes = EdamamApiWrapper.list_recipes(params[:q])
    else
      redirect_to recipes_path
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:r])
  end


end

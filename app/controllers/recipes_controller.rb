class RecipesController < ApplicationController

  def index
    if params[:q]
      @recipes = EdamamApiWrapper.list_recipes(params[:q])
    else
      redirect_to root_path
    end
  end

  def show
    @recipes = EdamamApiWrapper.list_recipes(params[:r])
  end

  def task_params
    params.require(:recipe).permit(:query)
  end
end

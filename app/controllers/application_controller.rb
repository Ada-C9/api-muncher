class ApplicationController < ActionController::Base
  def index
    @recipes = EdamamApiWrapper.recipe_list
  end

  def show
    @recipe = params[:recipe]
  end
end

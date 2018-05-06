class EdamamsController < ApplicationController

  def index
    @recipe_list = RecipeApiWrapper.recipes(params[:recipe])
  end

  def new
    @search_for = params[:recipe]
  end

  def show

  end
end

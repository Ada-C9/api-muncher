class EdamamsController < ApplicationController

  def new
    @recipe_list = RecipeApiWrapper.recipes(params[:recipe])
  end

  def show

  end
end

class EdamamsController < ApplicationController
  def root

  end

  def index
    @recipe_list = RecipeApiWrapper.recipes(params[:recipe])
  end

  def show

  end
end

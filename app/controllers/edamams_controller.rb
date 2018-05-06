class EdamamsController < ApplicationController

  def index

  end

  def new
    @recipe_list = RecipeApiWrapper.recipes(params[:recipe])
  end

  def show

  end
end

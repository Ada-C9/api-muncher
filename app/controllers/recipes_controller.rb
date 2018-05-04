class RecipesController < ApplicationController
  def search
  
  end

  def index
    if params[:q].blank?
      redirect_to root_path
    else
      query = params[:q]
      @recipes = EdamamApiWrapper.search(q)
    end
  end

  def show
    @recipe = EdamamApiWrapper.search(params[:id])[0]

  end
end

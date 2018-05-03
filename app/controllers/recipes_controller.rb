class RecipesController < ApplicationController
  def index
    @query = params[:q]
    @recipes = EdamamApiWrapper.search(@query)
  end

  def show
  end

  def search
  end
end

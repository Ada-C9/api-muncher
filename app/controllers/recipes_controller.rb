class RecipesController < ApplicationController
  def index
    @query = params[:q]
    @recipes = EdamamApiWrapper.search(@query)
  end

  def show
    @recipe = EdamamApiWrapper.find_by_uri(params[:uri])
    if @recipe.nil?
      render_404
    end
  end

  def search
  end
end

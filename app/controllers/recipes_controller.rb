class RecipesController < ApplicationController

  def search; end

  def index
    @query = params[:query]
    search = EdamamApiWrapper.search(@query)
    if search
      @recipes = search.recipes.paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    @recipe = EdamamApiWrapper.single_search(params[:id])
  end

end

class RecipesController < ApplicationController
  def index
    @query = params[:q]
    @page = params[:page].nil? ? 1 : params[:page].to_i
    search_result = EdamamApiWrapper.search(@query, @page)
    @recipes = search_result[:recipes]
    @last_page = (search_result[:count] / 10.0).ceil
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

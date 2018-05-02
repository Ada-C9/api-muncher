class RecipesController < ApplicationController
  def root
    @query = params[:query]
  end

  def search
    query = params[:query]
    @results = EdamamApiWrapper.search(query)

    redirect_to root_path
  end

  def results
    @results = EdamamApiWrapper.list_results
  end

  def show
  end
end

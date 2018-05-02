require 'pry'
class RecipesController < ApplicationController
  def root
    query = params[:query]
    if query
      redirect_to results_path(query)
    end
  end

  def search
    query = params[:query]
    if query
      redirect_to results_path(query)
    end
    @results = EdamamApiWrapper.search(query)

    # if @results
    #   flash[:status] = :success
    #   flash[:message] = "Found recipes for #{query}"
    #   session[:results] = results
    #   redirect_to results_path
    # else
    #   flash.now[:status] = :failure
    #   flash.now[:message] = "Could not find recipes for #{query}"
    #   render :root
    # end
  end

  def results
    @query = params[:query]
    results = EdamamApiWrapper.search(@query)
@results = Kaminari.paginate_array(results).page(params[:page]).per(10)
  end

  def show
    binding.pry
    @recipe = params[:recipe]
    @result = EdamamApiWrapper.search(recipe)
  end
end

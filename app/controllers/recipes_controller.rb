
class RecipesController < ApplicationController
  def root
    query = params[:query]
    if query
      redirect_to results_path(query)
    end
  end

  def results
    @query = params[:query]
    # binding.pry
    results = EdamamApiWrapper.search(@query)

    @results = Kaminari.paginate_array(results).page(params[:page]).per(12)

    if @results.length > 0
      flash.now[:status] = :success
      flash.now[:message] = "Found recipes for #{@query}"
    elsif @results.length == 0
      flash.now[:status] = :failure
      flash.now[:message] = "Could not find recipes for #{@query}"
    end
  end

  def show
    recipe = params[:id]
    @result = EdamamApiWrapper.search(recipe)
  end
end

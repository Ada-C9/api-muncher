class RecipeController < ApplicationController
  before_action :require_user_log_in, only: [:show]
  #First attempt at design - is this another valid approch?
  # def new
  #   @query = "user_input"
  #   #can i update this in the form? Or do i need a seperate method?
  #   # raise
  # end

  # def search
  #   @query = params["user_input"]
  #   redirect_to query_results_path(@query)
  # end

  def index
    @query = params[:query]
    if params[:from] && params[:to]
      @recipes = RecipeApiWrapper.limited_query(@query,params[:from],params[:to])
    else
    @recipes = RecipeApiWrapper.list_of_queried_recipes(@query)
      if @recipes == []
        flash[:status] = :error
        flash[:message] = "We currently do not have any #{@query} recipes."
      else
        flash[:status] = :success
        flash[:message] = "Sucecssfully found #{@query} recipes."
      end
    end

  end

  def show
    @recipe = RecipeApiWrapper.a_recipe(params[:uri])

  end

end

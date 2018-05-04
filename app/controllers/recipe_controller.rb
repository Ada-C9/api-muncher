class RecipeController < ApplicationController
  # def new
  #   @query = "user_input"
  #   #can i update this in the form? Or do i need a seperate method?
  #   # raise
  # end

  # def search
  #   #should be post because we are modifiying content - despite not having a server....''
  #   # raise
  #   @query = params["user_input"]
  #   redirect_to query_results_path(@query)
  # end

  def index
    @query = params[:query]
    if params[:from] && params[:to]
      @recipes = RecipeApiWrapper.limited_query(@query,params[:from],params[:to])
    else
    @recipes = RecipeApiWrapper.list_of_queried_recipes(@query)
    end
  end

  def show
    @recipe = RecipeApiWrapper.a_recipe(params[:uri])
  end

end


#Questions
#10 unsure of how restful my set up is, especially routes
#2) attempted to build w/o new/create set up but couldn't figure out how to update new method with params info..is there a way?
#3) how weird does this solution look?

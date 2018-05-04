class RecipeController < ApplicationController
  def index
    query = params["query"]

    results = EdamamApiWrapper.find_it(query)
    @recipes = results.paginate(:page => params[:page], :per_page => 2) 
    if @recipes.length > 0
      flash[:success] = "#{@recipes.length} Recipes Found!"
    else
      flash[:alert] = "No Recipes Found :("
    end
  end

  def create
  end

  def new
  end

  def destroy
  end

  def edit
  end

  def update
  end
end

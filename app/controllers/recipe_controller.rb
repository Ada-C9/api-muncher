class RecipeController < ApplicationController
  def index
    query = params["query"]

    if EdamamApiWrapper.find_it(query)
      results = EdamamApiWrapper.find_it(query)
      @recipes = results["hits"]
      
      flash[:success] = "Found!"

    else
      flash[:alert] = "Error"
    end
  end

  def create

    query = params["query"]

    if EdamamApiWrapper.find_it(query)
      results = EdamamApiWrapper.find_it(query)
      @recipes = results["hits"]
      flash[:success] = "Found!"
    else
      flash[:alert] = "Error"
    end

    redirect_to results_path
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

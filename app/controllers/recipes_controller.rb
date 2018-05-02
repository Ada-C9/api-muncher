class RecipesController < ApplicationController

  def root
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search])

    if @recipes.count < 1
      flash[:error] = "No recipies available for that search. Please try again!"
    end
  end

  def show
  end

  private

end

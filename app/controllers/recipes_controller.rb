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
  end

  def show
  end

  private

end

class MuncherController < ApplicationController

  def search
  end

  def index
    if params[:search] == ""
      flash[:status] = :alert
      flash[:result_text] = "Please enter a valid search term"
      redirect_to root_path
    else
      @recipes = EdamamApiWrapper.list_recipes(params[:search]).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:id])
    if !@recipe
      flash[:status] = :alert
      flash[:result_text] = "Recipe does not exist"
      redirect_to root_path
    end
  end

end

class RecipesController < ApplicationController
  def root
  end

  def search
    recipes = MuncherApiWrapper.search_recipes(params[:search_term])
    redirect_to index_path(search_term: params[:search_term])

  end

  def index
    search_term = params[:search_term]
    @recipes = MuncherApiWrapper.search_recipes(search_term).paginate(:page => params[:page], :per_page => 10)
    # raise
  end

  def show
    @recipe = MuncherApiWrapper.show_recipe(params[:format])
    if !@recipe
      redirect_to root_path
    end
  end

end

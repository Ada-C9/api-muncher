class RecipesController < ApplicationController

  def root
  end

  def index
    @query = params[:query]
    @recipes = MuncherApiWrapper.get_recipes(@query).paginate(:page => params[:page], :per_page => 12)

    unless session[:recent_searches].include?(@query)
      session[:recent_searches] << @query
    end
  end

  def show
    recipe_uri = params[:uri]
    @recipe = MuncherApiWrapper.get_one_recipe(recipe_uri)
  end
end

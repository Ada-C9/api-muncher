class RecipesController < ApplicationController

  before_action :save_recent_searches

  def root
  end

  def index
    @query = params[:query]
    @recipes = MuncherApiWrapper.get_recipes(@query).paginate(:page => params[:page], :per_page => 12)
    session[:recent_searches] << @query
  end

  def show
    recipe_uri = params[:uri]
    @recipe = MuncherApiWrapper.get_one_recipe(recipe_uri)
  end

  private
  def save_recent_searches
    session[:recent_searches] = []
  end
end

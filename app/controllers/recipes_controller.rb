class RecipesController < ApplicationController

  def root;
    @no_search_in_header = true
  end

  def index
    begin
      @query = params[:query]
      @recipes = MuncherApiWrapper.get_recipes(@query).paginate(:page => params[:page], :per_page => 12)

      unless session[:recent_searches].include?(@query) || @recipes.empty?
        session[:recent_searches] << @query
      end
    rescue
      flash[:status] = :error
      flash[:message] = 'Oops, something went wrong, please try your search again'
      redirect_to root_path
    end
  end

  def show
    begin
      recipe_uri = params[:uri]
      @recipe = MuncherApiWrapper.get_one_recipe(recipe_uri)
    rescue
      flash[:status] = :error
      flash[:message] = 'Oops, something went wrong, please try your search again'
      redirect_to root_path
    end
  end
end

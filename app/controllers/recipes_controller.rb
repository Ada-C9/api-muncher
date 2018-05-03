class RecipesController < ApplicationController

  def index
    @query = params[:q]
    @recipes = ApiMuncherWrapper.get_recipes(@query)
  end

end

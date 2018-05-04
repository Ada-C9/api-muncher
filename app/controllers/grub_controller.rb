class GrubController < ApplicationController

    def index
      @recipes = EdamamApiWrapper.recipe_list(params[:recipe])
    end

    def new
      @recipe_search = params[:recipe]
    end

    def show
      @recipe = params[:recipe]
    end
end

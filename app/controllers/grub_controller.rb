class GrubController < ApplicationController

    def index
      @recipes = EdamamApiWrapper.recipe_list(params[:recipe])
      @paginatable_array = Kaminari.paginate_array(@recipes).page(params[:page]).per(6)
    end

    def new
      @recipe_search = params[:recipe]
    end

    def show
      # @recipes = EdamamApiWrapper.recipe_list(params[:recipe])
      # @recipes.each do |recipe|
      #   if recipe.id
      #     @uri = params[:uri]
      #   end
      # end
      # @recipe = EdamamApiWrapper.recipe_detail(@uri)
    end

end

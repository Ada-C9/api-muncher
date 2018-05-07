class GrubController < ApplicationController
  around_action :catch_api_error

    def index
      @recipes = EdamamApiWrapper.recipe_list(params[:recipe]).paginate(page: params[:page], per_page: 10)
    end

    def new
      @recipe_search = params[:recipe]
    end

    def show
      uri = params[:uid]
      @recipe = EdamamApiWrapper.recipe_detail(uri)
    end

  private
  def catch_api_error
    begin
      yield
    rescue EdamamApiWrapper::RecipeError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end

end

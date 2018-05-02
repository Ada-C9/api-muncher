class RecipesController < ApplicationController
  around_action :catch_api_error

  def index
    @recipes = EdamamApiWrapper.list_recipes
  end

  def new
    @recipe_name = params[:recipe]
  end

  def show

  end

  private
  def catch_api_error
    begin
      # This will run the actual controller action
      # Actually the same yield keyword as in
      # application.html.erb
      yield
    rescue EdamamApiWrapper::EdamamError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end

end

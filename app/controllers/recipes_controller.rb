
class RecipesController < ApplicationController
  around_action :catch_api_error

  def root
  end

  def index
    @query = params[:query]
    # return @recipes = RecipeSearchWrapper.search_recipes(@query)
    @recipes = RecipeSearchWrapper.search_recipes(@query).paginate(:page => params[:page], :per_page => 10)

  end

  def show
    @recipe = RecipeSearchWrapper.find_recipe(params[:uri])
  end

  private
  def catch_api_error
    begin
      # This will run the actual controller action
      # Actually the same yield keyword as in
      # application.html.erb
      yield
    rescue RecipeSearchWrapper::RecipeError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end
end

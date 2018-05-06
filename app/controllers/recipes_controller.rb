class RecipesController < ApplicationController
  around_action :catch_api_error

  def index
    @query = params[:query]
    @recipes = RecipeApiWrapper.list_recipes(@query).paginate(:page => params[:page], :per_page => 12)
    redirect_to root_path if @recipes.length == 0
  end

  def show
    @recipe = RecipeApiWrapper.show_recipe(params[:uri])
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

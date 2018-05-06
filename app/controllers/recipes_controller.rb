
class RecipesController < ApplicationController
  around_action :catch_api_error

  def root
  end

  def index
    @query = params[:query]

    @recipes = RecipeSearchWrapper.search_recipes(@query)
    if @recipes.empty?
      flash[:status] = :failure
      flash[:result_text] = "There are no recipes for #{params[:query]}. Maybe you could write one?"
      redirect_to root_path
    else
      @recipes = @recipes.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @recipe = RecipeSearchWrapper.find_recipe(params[:uri])

    # unless @recipe
    #   head :not_found
    # end
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
      flash[:result_text] = "API call failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end
end

class RecipesController < ApplicationController
  def index
    @query = params[:query]
    @recipes = RecipeApiWrapper.list_recipes(@query).paginate(:page => params[:page], :per_page => 12)
    # @recipe = RecipeApiWrapper.show_recipe("http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_48c52ac3bd8c16720a7cb8ef34cd5e5b")
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

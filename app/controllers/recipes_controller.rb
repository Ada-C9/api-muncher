class RecipesController < ApplicationController
  # shows the results from query : recipes GET  /recipes(.:format)
  def index
    if params[:query].blank?
      redirect_to root_path
    else
      @query = params[:query]
      @recipes = EdamamApiWrapper.list_recipes(@query).paginate(page: params[:page], per_page: 10)
    end
  end

  # shows a single recipe : recipe GET  /recipes/:id(.:format)
  def show
    recipe = EdamamApiWrapper.show_recipe(params[:id])
    if recipe == nil
      flash[:error] = "Recipe does not exist. Please do a new recipes search."
      redirect_to root_path
    else
      @recipe = recipe
    end
  end

  # form for search also root
  def new
    @query = params[:query]
  end
end

class RecipesController < ApplicationController

  def index
    @query = params[:q]
    @recipes = ApiMuncherWrapper.get_recipes(@query)
  end

  def show
    r = params[:r]
    recipe_details = ApiMuncherWrapper.get_recipe(r)

    # Is this ok to pass an array and have to know where in the array this is? Or is it better to make a picture class?
    # Or should I make this an attribute of the recipe class default to nil if not included?
    @recipe = recipe_details
    # @recipe_pic = recipe_details[1]
  end

end

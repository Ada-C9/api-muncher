class RecipesController < ApplicationController

  def homepage; end

  def index
    recipes = EdamamApiWrapper.all_recipes(params[:user_input])

    @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(12)

    if @recipes == []
      message = "Nothing found while searching #{params[:user_input]} Please try a different search term!"
      status(:error, message)
      puts "Sorry. No recipes found for #{params[:user_input]}"
    else
      puts "Found recipes!"
      message = "Results found for #{params[:user_input]}"
      status(:success, message)
    end
  end

  def show
    @recipe = EdamamApiWrapper.one_recipe(params[:id])
  end

private

  def status_message(status, message)
      flash[:status] = status
      flash[:result_text] = message
  end

end

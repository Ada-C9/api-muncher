require 'kaminari'

class RecipesController < ApplicationController

  def home
  end


  def index
    @search_term = params[:search_term]

    if @search_term.blank?

      flash[:status] = :failure
      flash[:message] = "Please enter a search term"
      redirect_to root_path
      return result_recipes = nil

    else

      result_recipes = EdamamApiWrapper.list_of_recipes(params[:search_term])
    end
    # added Kaminari gem to make the pagination
    @recipes = Kaminari.paginate_array(result_recipes).page(params[:page]).per(10)


  end


  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])

    if !@recipe
      return render_404
    end
  end

end

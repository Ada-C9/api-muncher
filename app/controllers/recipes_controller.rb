require 'kaminari'

class RecipesController < ApplicationController

  def home
  end
  
  def index


    if params[:search_term]
      result_recipes = EdamamApiWrapper.list_of_recipes(params[:search_term])

      # added Kaminari gem to make the pagination
      @recipes = Kaminari.paginate_array(result_recipes).page(params[:page]).per(10)

    end
  end



  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])

    if !@recipe
      return render_404
    end
  end

end

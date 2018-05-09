# require_relative '../../lib/edamam_api_wrapper.rb'
class RecipesController < ApplicationController
  def new
  end

  def index
    search_term = params[:q]

    if search_term.nil? || search_term == ""
      flash[:status] = :failure
      flash[:message] = "Please enter a search term"
      redirect_to root_path
    elsif EdamamApiWrapper.list_recipes(search_term).empty?
      flash[:status] = :failure
      flash[:message] = "Sorry, We couldn't find any matching recipes"
      redirect_to root_path
    else
      @results = Kaminari.paginate_array(EdamamApiWrapper.list_recipes(search_term)).page(params[:page]).per(10)

    end
  end

  def show
    id = params[:id]
    @recipe = EdamamApiWrapper.show_recipe(id)
  end
end

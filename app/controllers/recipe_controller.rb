class RecipeController < ApplicationController
  def root
  end

  def index
    @search_terms = params[:search_terms]
    if @search_terms.nil? || @search_terms.strip == ""
      flash[:alert] = "How about we try something that not a blank space?"
      redirect_to root_path
    else
      @start_index = params[:start_index].to_i
      if @start_index
        recipe_search = EdamamApiWrapper.list_recipes(@search_terms, @start_index)
      else
        recipe_search = EdamamApiWrapper.list_recipes(@search_terms)
      end
      if recipe_search == {}
        flash[:alert] = "Slow down, try smelling the metaphorical roses"
        redirect_to root_path
      else
        @recipes = recipe_search[:recipe_list]
        @page_count = recipe_search[:page_count]
        if @page_count == 0
          flash[:alert] = "Sorry, looks like that's not a thing"
          redirect_to root_path
        elsif @recipes.empty?
          flash[:alert] = "Nope, no more."
        end
      end
    end
  end

  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.return_recipe(uri)
    if !@recipe
      flash[:alert] = "Sorry, no luck on that one."
      redirect_to root_path
    end
  end
end

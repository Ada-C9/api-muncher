class RecipesController < ApplicationController
  def index
    @query = params[:q]

    if params[:page].nil?
      # This is the page we are on, starting a 0
      params[:page] = 0
    end

    if @page < 0
      flash[:error] = "Invalid recipes results range"
      # redirect/ render?
    elsif @query.nil?
      flash[:error] = "Invalid search value"
      # redirect/ render?
    end

    @page = params[:page]

    all_recipes_info = ApiMuncherWrapper.get_recipes(@query, @page)

# how do i process no recipes that match search query
    if !all_recipes_info
      flash[:message] = "Sorry, that recipe doesnt exist"
      flash[:error] = "Invalid recipe url"
      # redirect/ render?
    end

    params[:count] = all_recipes_info[0]
    @count = params[:count]

    # This is the page we are on, starting a 0
    params[:page] = all_recipes_info[1]
    @page = params[:page]

    @recipes = all_recipes_info[2]

  end

  def show
    r = params[:r]

    if r.nil?
      flash[:message] = "Sorry, that recipe doesnt exist"
      flash[:error] = "Invalid recipe url"
      # redirect/ render?
    end

    recipe_details = ApiMuncherWrapper.get_recipe(r)

    if !recipe_details
      flash[:message] = "Sorry, that recipe doesnt exist"
      flash[:error] = "Invalid recipe url"
      # redirect/ render?
    end

    @recipe = recipe_details
  end

end

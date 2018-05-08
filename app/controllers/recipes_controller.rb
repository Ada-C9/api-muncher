class RecipesController < ApplicationController
  def index
    @query = params[:q]

    if params[:page].nil?
      # This is the page we are on, starting a 0
      params[:page] = 0
    end

    @page = params[:page].to_i

    if @page < 0
      flash[:error] = "Invalid recipes results range"
      redirect_to :root
    elsif @query.nil?
      flash[:error] = "Invalid search value"
      redirect_to :root
    end

    all_recipes_info = ApiMuncherWrapper.get_recipes(@query, @page)

    if @count == 0
      flash[:message] = "Sorry, that recipe doesnt exist"
      flash[:error] = "Invalid recipe url"
      redirect_to :root
    end

    params[:count] = all_recipes_info[0]
    @count = params[:count]

    if @count == 0
      flash[:message] = "Sorry, that recipe doesnt exist"
      flash[:error] = "Invalid recipe url"
      redirect_to :root
    end

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
      redirect_to :root
    end

    recipe_details = ApiMuncherWrapper.get_recipe(r)

# should this be in ApiMuncherWrapper???
    if recipe_details == false
      flash[:message] = "Sorry, that recipe doesnt exist"
      flash[:error] = "Invalid recipe url"
      redirect_to :root
    end

    @recipe = recipe_details
  end

end

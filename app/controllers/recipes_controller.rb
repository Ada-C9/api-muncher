class RecipesController < ApplicationController
  before_action :find_user

  def home
  end

  def index
    if params[:term] && params[:term].strip.length > 0
      if params[:page_num]
        @recipes = EdamamApiWrapper.list_recipes(params[:term], params[:page_num])
      else
        @recipes = EdamamApiWrapper.list_recipes(params[:term], 1)
      end
      session[:term] = params[:term]
      if session[:term_collection].nil?
          session[:term_collection] = [params[:term]]
      elsif !session[:term_collection].include?(params[:term])
        session[:term_collection] << params[:term]
      end
    else
      flash[:status] = :failure
      flash[:result_text] = "Please enter a valid term for searching"
      redirect_back fallback_location: root_path
    end

  end

  def show
    if params[:recipe_id] && params[:recipe_id].length == 32
      @recipe = EdamamApiWrapper.find_recipe(params[:recipe_id])
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not find that recipe"
      redirect_to recipes_path
    end
  end

  def favorites
    @favorite_recipes = @login_user.favorite_recipes
  end

  def add_favorite
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
    favorite_recipe = FavoriteRecipe.new
    favorite_recipe.recipe_id = @recipe.id
    favorite_recipe.label = @recipe.title
    favorite_recipe.image = @recipe.image
    favorite_recipe.source = @recipe.source
    favorite_recipe.url = @recipe.url
    favorite_recipe.user_id = @login_user.id
    if favorite_recipe.save
      flash[:status] = :success
      flash[:result_text] = "Recipe added to Favorites successfully"
      redirect_to favorite_recipes_path
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Could not add this recipe to Favorites"
      render :show
    end
  end

end

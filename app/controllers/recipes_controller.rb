class RecipesController < ApplicationController

def index
  @recipes = EdamamApiWrapper.list_recipes
end

def show
  @recipe = 
end

end

class RecipesController < ApplicationController

def index
  @recipes = EdamamApiWrapper.list_recipes
end

def show
end

end

class RecipesController < ApplicationController
	def index
		@recipes = RecipeApiWrapper.list_recipes
	end

	def search
		@recipe = RecipeApiWrapper.search_recipes
	end
end

class RecipesController < ApplicationController
	def index
		query = params[:q]

		@recipes = RecipeApiWrapper.list_recipes(query)
	end

	def search
		# have a view for this route but no functions necessary
	end

	def show
		uid = params[:uid]
	
		@recipe = RecipeApiWrapper.get_details(uid)
	end
end

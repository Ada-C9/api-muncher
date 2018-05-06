class RecipesController < ApplicationController
	def index
		query = params[:q]

		@recipes = RecipeApiWrapper.list_recipes(query)
	end

	def search
		# have a view for this route but no functions necessary
	end

	def show
		uri = params[:uri]

		@recipe = RecipeApiWrapper.get_details(uri)
		raise
	end
end

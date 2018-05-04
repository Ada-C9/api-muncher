class RecipesController < ApplicationController
	def index
		query = params[:q]

		@recipes = RecipeApiWrapper.list_recipes(query)

		# if RecipeApiWrapper.list_recipes(query)
		# 	flash[:success]
		#
		# 	# redirect_to recipes_path
		# else
		# 	flash[:alert] = "Something's not working."
		# end
	end
end

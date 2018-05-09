## TODO: count param for seeing end of a short query

class RecipesController < ApplicationController
	MAX_PER_PAGE = 12

	def index
		@query = params[:q]
		@from = params[:from].nil? ? 0 : params[:from].to_i
		@to = params[:to].nil? ? @from + MAX_PER_PAGE : params[:to].to_i

		@recipes = RecipeApiWrapper.list_recipes(@query, @from, @to)

		# Previous
		# TODO: Calculate previous from/to (into new variables)

		# Next
		@from += MAX_PER_PAGE
		@to = @from + MAX_PER_PAGE
	end

	def search
		# have a view for this route but no functions necessary
	end

	def show
		uri = params[:uri]

		@recipe = RecipeApiWrapper.get_details(params[:uri])

		head :bad_request unless @recipe
	end
end

# <%=link_to(recipe.label, recipe_path(:uri => recipe.uri), method: :get)%>

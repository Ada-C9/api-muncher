class RecipesController < ApplicationController
	MAX_PER_PAGE = 12

	def index

		query = params[:q]

		recipes = RecipeApiWrapper.list_recipes(query)

		if recipes
			@recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(MAX_PER_PAGE)
		end
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

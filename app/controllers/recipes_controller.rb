class RecipesController < ApplicationController

	# displays up to 10 results at a time from search
	def results
		if params[:query_text] || session[:query_text]
				session[:query_text] = params[:query_text] if params[:query_text]
				start = params[:start] || 0
				# start *= 10
				search_results = EdamamApiWrapper.search_recipes(session[:query_text], start)
				@recipes = search_results[:recipes]
				@max_pages = search_results[:max_pages]
		else
			flash[:alert] = "Something broke!"
			redirect_to root
		end
	end

	def show
	end

	def search
	end

end

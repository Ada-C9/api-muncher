class RecipesController < ApplicationController

	# displays up to 10 results at a time from search
	def results
		if params[:query_text] || session[:query_text]
				# query_text = set_query_text(params[:query_text])
				session[:query_text] = params[:query_text] if params[:query_text]
				from = set_from(params[:from])
				search_results = EdamamApiWrapper.search_recipes(session[:query_text], from)
				@recipes = search_results[:recipes]
				@max_pages = search_results[:max_pages]
		else
			flash[:alert] = "Something broke!"
			redirect_to root
		end
	end

	def show
		@recipe = EdamamApiWrapper.get_recipe(params[:uri])
	end

	def search
	end

	private

	def set_query_text(query_text)
		# If query_text if not nil, it is search result and represents a new search.
		# It stores this value in session[:query_text], in case past results are
		# a feature in future versions.
		session[:query_text] << query_text if query_text
		return session[:query_text].last
	end

	def set_from(from)
		# from is nil if it is the first time
		return from.nil? ? 0 : (from.to_i - 1) * 10
	end
end

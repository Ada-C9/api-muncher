class RecipesController < ApplicationController

	def results
		if params[:query_text] || session[:query_text]
				# query_text = set_query_text(params[:query_text])
				session[:query_text] = params[:query_text] if params[:query_text]
				from = set_from(params[:from])
				search_results = EdamamApiWrapper.search_recipes(session[:query_text], from)
				@curr_from = params[:from].to_i
				@recipes = search_results[:recipes]
				@max_pages = search_results[:max_pages]
		else
			flash[:alert] = "Something done broke!"
			redirect_to root
		end
	end

	def show
		@recipe = EdamamApiWrapper.get_recipe(params[:uri])
		if !@recipe
			flash[:alert] = "Recipe does not exist"
			redirect_to root_path
		end
	end

	def search
	end

	private

	def set_from(from)
		# 'from' is nil if it is coming from the search form. The rationale behind
		# this was not to put this responsibility on view.
		return from.nil? ? 0 : (from.to_i - 1) * 10
	end

	# !! Not currently used! This feature should be implemented is a future version
	# of the program wants to store previous searches.
	# def set_query_text(query_text)
	# 	# If query_text if not nil, it is search result and represents a new search.
	# 	# It stores this value in session[:query_text], in case past results are
	# 	# a feature in future versions.
	# 	session[:query_text] << query_text if query_text
	# 	return session[:query_text].last
	# end
end

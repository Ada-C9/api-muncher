class RecipesController < ApplicationController
	# def index
	# end

	# displays up to 10 results at a time from search
	def results
		if params[:query_text] || session[:query_text]
				session[:query_text] = params[:query_text] if params[:query_text]
				start = params[:start] || 0
				search_results = EdamamApiWrapper.search_recipes(session[:query_text], start)
				@recipes = search_results[:recipes]
				@max_pages = search_results[:max_pages]
		else
			flash[:alert] = "Something broke!"
			redirect_to root
		end

	end

	# Shows details about a recipe
	def show
	end

	# makes api request using search term
	def search


	end

end

## FROM SLACKAPI
# def index
# 		@channels = SlackApiWrapper.list_channels
# end
#
# def new
# 	@channel = params[:channel]
# end
#
# def create
# 	channel = params[:channel]
# 	message = params[:massage] # from form
# 	if SlackApiWrapper.send_message(channel, message)
# 		flash[:success] = "Message Sent!"
# 	else
# 		flash[:alert] = "Error Sending"
# 	end
# 	redirect_to chat_new_path(channel)
# end

class RecipesController < ApplicationController
	# def index
	# end

	# displays up to 10 results at a time from search
	def results
		query_text = params[:query_text] # from form
		session[:query_text] = query_text
		# session[:diet] = params[:diet]
		@recipes = EdamamApiWrapper.search_recipes(
			query_text, 0, 40, diet: nil, health: nil).paginate(
				:page => params[:page], :per_page => 10)

		# @recipes_page_2 = EdamamApiWrapper.search_recipes(
		# 	query_text, from: 12, to: 24, diet: nil, health: nil).paginate(
		# 		:page => params[:page], :per_page => 10)
		# @recipes = EdamamApiWrapper.search_recipes(query_text, diet: nil).paginate(
		# 	:page => params[:page], :per_page => 15)


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

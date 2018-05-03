class RecipesController < ApplicationController
	# def index
	# end

	# displays up to 10 results at a time from search
	def results
		query_text = params[:query_text] # from form
		@recipes = EdamamApiWrapper.search_recipes(
			query_text, from: 0, to: 40, diet: nil, health: nil).paginate(
				:page => params[:page], :per_page => 10)


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

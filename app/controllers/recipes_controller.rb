class RecipesController < ApplicationController

	# displays up to 10 results at a time from search
	def list
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

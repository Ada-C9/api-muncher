class RecipesController < ApplicationController

  def root
  end

  def index
  @query = params[:search]
  @recipes = EdamamApiWrapper.list_recipes(@query)
  end

  def new
    @recipe = params[:recipe]
  end

  def create
    recipe = params[:recipe]

    if SlackApiWrapper.send_message(channel, message)
      flash[:success] = "Message Sent!"
    else
      flash[:alert] = "Error Sending"
    end

    redirect_to chat_new_path(channel)
  end
end

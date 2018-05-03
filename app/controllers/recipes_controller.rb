class RecipesController < ApplicationController
  around_action :catch_api_error

  # return a list of searched recipes
  def index
    # Need to turn this into a blank and waiting search bar
    # @recipes = EdemamApiWrapper.search_recipes
  end

  def search
    raise
  end

  # Show a found recipes details
  # def show

  # end

  private
  def catch_api_error
    begin
      # Controller Action I want to run up in here
      yield
      # Oh no, error occured in the app, SOS and rescue
    rescue EdemamApiWrapper::EdemamError => error
      flash[:status] = :failure
      flash[:message] = "Api called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end
end

class FoodController < ApplicationController
  around_action :catch_api_error

  def root
  end

  def index
  end


  private
  def catch_api_error
    begin
      # This will run the actual controller action
      # Actually the same yield keyword as in
      # application.html.erb
      yield
    rescue SlackApiWrapper::SlackError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end
end

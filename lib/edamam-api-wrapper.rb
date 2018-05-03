require "HTTParty"

class EdamamApiWrapper
  URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(q)
    response = HTTParty.get("#{URL}" + "q=#{q}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}")
  end


  private
  def self.create_recipe(api_params)
    return Recipe.new(
    )
  end
end

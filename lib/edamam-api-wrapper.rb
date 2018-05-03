require "HTTParty"

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(q)
    response = HTTParty.get("#{BASE_URL}")
  end


  private
  def self.create_recipe(api_params)
    return Recipe.new(
    )
  end
end

require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(ingredient)
    response = HTTParty.get("#{URL}?q=")

  end
end

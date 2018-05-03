require 'httparty'
require 'pry'

class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search_recipes(name)
    url = BASE_URL + "?q=#{name.gsub(' ', '+')}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    data = HTTParty.get(url)

    if data["hits"]
      recipes = data["hits"].map do |hash|
        recipe = hash["recipe"]
        Recipe.new(recipe["label"],
        recipe["uri"]),
        image: recipe ["image"],
        source: recipe['source'],
        url: recipe['url']#
      )
      end
      return
      recipes
    else
      return []
    end
  end
end

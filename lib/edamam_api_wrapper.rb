require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(ingredient)
    response = HTTParty.get("#{URL}?q=#{ingredient}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    recipes = []


    if response["hits"]
      response["hits"].each do |recipe|
        recipes << Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["url"], recipe["recipe"]["ingredientlines"], recipe["recipe"]["image"], recipe["recipe"]["healthlabels"])
      
      end

    end
  end
end

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
        recipes << Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["uri"], recipe["recipe"]["ingredientlines"], recipe["recipe"]["image"], recipe["recipe"]["healthlabels"])
      end
    end

    return recipes
  end

  def self.get_recipe(uri)
    uri.encode
    response = HTTParty.get("#{URL}?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe#{}")
  end
end

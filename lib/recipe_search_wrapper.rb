require 'httparty'
require 'pry'

class RecipeSearchWrapper
  URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(search)
    response = HTTParty.get("#{URL}search?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    list_recipes = []
    if response["hits"]
      response["hits"].each do |recipe|
        uri = recipe["recipe"]["uri"]
        id = RecipeSearchWrapper.parse_id(recipe["recipe"]["uri"])
        name = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        list_recipes << Recipe.new(id, name, image)
      end
    end

    return list_recipes
  end

  def self.parse_id(uri)
    length = uri.length
    index = uri.index("_")
    return uri[index,length]
  end

  def self.find_recipe(recipe_id)

  end
end

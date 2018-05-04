require 'httparty'
require 'uri-handler'

class RecipeApiWrapper
  APP_ID = ENV["APPID"]
  APP_KEY = ENV["APPKEY"]


  def self.list_of_queried_recipes(query)
    response = HTTParty.get("https://api.edamam.com/search?q=#{query}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    list_of_recipes = []
    response["hits"].each do |recipe_hash|
      list_of_recipes << Recipe.new(recipe_hash["recipe"])
    end

    return list_of_recipes
  end

  def self.a_recipe(recipe)
    a_recipe = recipe.uri_encode
    response = HTTParty.get("https://api.edamam.com/search?app_id=#{APP_ID}&app_key=#{APP_KEY}&r=#{a_recipe}")
    recipe = Recipe.new(response[0])
    return recipe
  end

  def self.limited_query(query,from,to)
    response = HTTParty.get("https://api.edamam.com/search?q=#{query}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=#{from}&to=#{to}")

    list_of_recipes = []
    response["hits"].each do |recipe_hash|
      list_of_recipes << Recipe.new(recipe_hash["recipe"])
    end

    return list_of_recipes
    end

    # return recipe


end

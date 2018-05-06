require 'httparty'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["API_APP_ID"]
  APP_KEY = ENV["API_APP_KEY"]
  FROM = 1
  TO = 100


  def self.list_recipes(query)

    full_url = URI.encode(BASE_URL + "?q=#{query}&app_id=" + APP_ID + "&app_key=" + APP_KEY + "&from=#{FROM}&to=#{TO}")

    response = HTTParty.get(full_url)

    raise RecipeError.new("Could not find recipes") unless response["hits"]

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end

  end


  def self.show_recipe(uri)

    uri_url = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
    full_url = URI.encode(BASE_URL + "?r=#{uri_url}#{uri}&app_id=" + APP_ID + "&app_key=" + APP_KEY + "&from=#{FROM}&to=#{TO}")

    response = HTTParty.get(full_url).parsed_response


    raise RecipeError.new("Could not find the recipe") unless response[0]

    return Recipe.from_api(response[0])
  end

end

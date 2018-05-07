class EdamamApiWrapper
  class RecipeError < StandardError ; end

  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]
  BASE_URL = "https://api.edamam.com/search?"
  URI_BASE = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
  FROM = 1
  TO = 50

  def self.recipe_list(food)
    encoded_uri = URI.encode("#{BASE_URL}q=#{food}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=#{FROM}&to=#{TO}")

    response = HTTParty.get(encoded_uri).parsed_response
    raise RecipeError.new("Could not find recipes") unless response["hits"]

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def self.recipe_detail(uri)

    encoded_uri = URI.encode("#{BASE_URL}r=#{URI_BASE}#{uri}&app_id=#{APP_ID}&app_key=#{APP_KEY}")
    response = HTTParty.get(encoded_uri)

    raise RecipeError.new("Could not find recipe") unless response[0]

    return Recipe.from_api(response[0])
  end

end

require 'httparty'
# require 'pry'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  TOKEN_ID = ENV["wolverine"]
  TOKEN_KEY = ENV["storm"]
  BASE_URL = "https://api.edamam.com/search?q="
  BASE_URI = "http://www.edamam.com/ontologies/edamam.owl#recipe_"

  def self.recipes(user_query)



    url = URI.encode("#{BASE_URL}#{user_query}&app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&from=#{0}&to=#{300}")

    response = HTTParty.get(url).parsed_response

    # ALWAYS CHECK YOUR ERROR CODES
    raise_on_error(response)

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def self.single_recipe(uri)

    full_uri = URI.encode("https://api.edamam.com/search?r=#{BASE_URI}#{uri}&app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}")

     response = HTTParty.get(full_uri).parsed_response
     return Recipe.from_api(response[0])

  end

  private
  def self.raise_on_error(response)
    # this needs to be changed based on the api
    unless response["more"]
      raise RecipeError.new(response["error"])
    end
  end
end

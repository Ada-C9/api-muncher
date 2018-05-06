require 'httparty'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  API_KEY = ENV["EDAMAM_API_KEY"]
  API_ID = ENV["EDAMAM_API_ID"]

  search_results = []
  def self.list_recipes(query)

    url = "https://api.edamam.com/search?app_id=#{API_ID}&app_key=#{API_KEY}&q=#{query}&to=120"

    encoded_uri = URI.encode(url)

    response = HTTParty.get(url).parsed_response
    # ALWAYS CHECK YOUR ERROR CODES
    # unless response.success?
    #   raise StandardError.new(response["error"])
    # end

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def self.show_recipe(uri)
    url = "https://api.edamam.com/search?app_id=#{API_ID}&app_key=#{API_KEY}&r=#{uri}"

    encoded_uri = URI.encode(url)

    response = HTTParty.get(encoded_uri).parsed_response
    # ALWAYS CHECK YOUR ERROR CODES
    # unless response["count"] == true
    #   raise StandardError.new(response["error"])
    # end

    return Recipe.from_api(response[0])
  end

  private

  def self.raise_on_error(response)
    unless response["count"]
      raise RecipeError.new(response["error"])
    end
  end
end

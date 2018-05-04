require 'httparty'
require 'pry'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  API_KEY = ENV["EDAMAM_API_KEY"]
  API_ID = ENV["EDAMAM_API_ID"]

  search_results = []
  def self.list_recipes

    query = "chicken pesto"
    url = "https://api.edamam.com/search?app_id=#{API_ID}&app_key=#{API_KEY}&q=#{query}"

    encoded_uri = URI.encoded(url)

    response = HTTParty.get(url).parsed_response
    #ALWAYS CHECK YOUR ERROR CODES
    unless response.success?
      raise StandardError.new(response["error"])
    end

    return response["hits"].each do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def show_recipe(uri)
    url = "https://api.edamam.com/search?app_id=#{API_ID}&app_key=#{API_KEY}&r=#{uri}"

    encoded_uri = URI.encoded(url)

    response = HTTParty.get(url)
    #ALWAYS CHECK YOUR ERROR CODES
    unless response.success?
      raise StandardError.new(response["error"])
    end

    return Recipe.from_api(response[0])
  end

  private

  def self.raise_on_error(response)
    unless response["ok"]
      raise ReecipeError.new(response["error"])
    end
  end
end

require 'httparty'
require 'pry'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  def self.list_recipes
    api_key = ENV["EDAMAM_API_KEY"]
    api_id = ENV["EDAMAM_API_ID"]

    url = "https://api.edamam.com/search?app_id=#{api_id}&app_key=#{api_key}&q=chicken"

    response = HTTParty.get(url)
    #ALWAYS CHECK YOUR ERROR CODES
    unless response.success?
      raise StandardError.new(response["error"])
    end

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def self.show_recipe(url)

  end

  private

  def self.raise_on_error(response)
    unless response["ok"]
      raise ReecipeError.new(response["error"])
    end
  end
end

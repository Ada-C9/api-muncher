require 'httparty'
require 'recipe.rb'
require 'pry'

class EdamamWrapper
  class EdamamError < StandardError; end
  BASE_URL = "https://api.edamam.com/search"
  def self.search_recipes(query)
    id = ENV["APP_ID"]
    key = ENV["APP_KEY"]

    url = BASE_URL + "?q=#{query}" + "&app_id=#{id}" + "&app_key=#{key}"
    response = HTTParty.get(url)

    # raise_on_error(response)

    return response["hits"].map do |recipe_hash|
      Recipe.from_api(recipe_hash)
    end
  end

  private
  def self.raise_on_error(response)
    unless response
      raise EdamamError.new("There are no recipes matching your search")

    end
  end
end

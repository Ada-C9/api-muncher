require 'httparty'
require 'pry'

class EdamamWrapper
  class EdamamError < StandardError; end

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.search_recipes(query)
    url = BASE_URL + "?q=#{query}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=0" + "&to=50"
    response = HTTParty.get(url)
    raise_on_error(response)

    return response["hits"].map do |recipe_hash|
      Recipe.from_api(recipe_hash["recipe"])
    end
  end

  def self.get_recipe(id)
    uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_" + "#{id}"

    encoded_uri = URI.encode(uri)

    url = BASE_URL + "?r=#{encoded_uri}" + "&app_id=#{ID}" + "&app_key=#{KEY}"

    response = HTTParty.get(url)

    raise_on_error(response)

    Recipe.from_api(response[0])
  end


  private
  def self.raise_on_error(response)
    if response.code != 200 || response.body == "[]"
      raise EdamamError.new("Unable to process your search at this time.")
    end
  end
end

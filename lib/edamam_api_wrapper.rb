require 'httparty'
require 'pry'

class EdamamApiWrapper
  class EdamamError < StandardError; end
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(search_term)
    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}"

    response = HTTParty.get(url)

    recipe_list = []


    if response["hits"]

      response["hits"].each do |recipe_response|


        recipe_list << Recipe.new(recipe_response["recipe"])

      end
    end

    return recipe_list
  end

  def self.recipe_show(uri)

    url_root = URI.encode("https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_")

    url = url_root + uri + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"

    response = HTTParty.get(url).parsed_response

    return Recipe.new(response[0])

  end
end

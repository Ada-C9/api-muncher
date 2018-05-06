require 'httparty'
require 'pry'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  SINGLE_RECIPE_URL = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
  APP_ID = ENV["EDAMAM_APPLICATION_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEY"]

  def self.search_recipes(search_term)
    url = "#{BASE_URL}?q=#{search_term}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=100"
    results = HTTParty.get(url)

    recipes_list = []

    if results["hits"]
      results["hits"].each do |result_data|
        recipe = Recipe.new(
          result_data["recipe"]["label"],
          result_data["recipe"]["uri"],
          result_data["recipe"]["ingredientLines"],
          result_data["recipe"]["image"],
          result_data["recipe"]["healthLabels"],
          result_data["recipe"]["url"],
          result_data["recipe"]["source"]
        )
        recipes_list << recipe
      end
    end
    return recipes_list
  end

  def self.show_recipe(id)
    encode = URI.encode("#{BASE_URL}?r=#{SINGLE_RECIPE_URL}#{id}&app_id=#{APP_ID}&app_key=#{APP_KEY}")
    response = HTTParty.get(encode)

    recipe = Recipe.new(
      response[0]["label"],
      response[0]["uri"],
      response[0]["ingredientLines"],
      response[0]["image"],
      response[0]["healthLabels"],
      response[0]["url"],
      response[0]["source"]
    )
    return recipe
  end

end

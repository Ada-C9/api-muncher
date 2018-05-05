require 'httparty'
require 'pry'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_APPLICATION_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEY"]

  def self.search_recipes(search_term)
    url = "#{BASE_URL}search?q=#{search_term}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    results = HTTParty.get(url)
    recipes_list = []
    if results["hits"]
      results["hits"].each do |result_data|
        recipe = Recipe.new(result_data["recipe"]["label"], result_data["recipe"]["image"], result_data["recipe"]["url"], result_data["recipe"]["ingredientLines"])
        recipes_list << recipe
      end
    end
      return recipes_list
  end

  def self.show_recipe(recipe_id)
    url = "#{BASE_URL}search?r=r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{recipe_d}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    response = HTTParty.get(url)
  end

  private

  def create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["image"],
      api_params["url"],
      api_params["ingredientLines"]
    )
  end

end

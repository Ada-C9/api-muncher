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
        recipes_list << create_recipe(result_data)
      end
    end
      return recipes_list
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

  def self.show_recipe

  end

end

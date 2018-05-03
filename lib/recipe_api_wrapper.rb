require 'httparty'

class RecipeApiWrapper

  URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.find_recipes(search_terms)
    encoded_search_terms = URI.encode(search_terms)
    response = HTTParty.get("#{URL}?q=#{encoded_search_terms}&app_id=#{ID}&app_key=#{KEY}")
    recipes_list = []
    if response["hits"]
      response["hits"].each do |hit|
        recipes_list << Recipe.new(hit["recipe"]["label"], hit["recipe"]["image"])
      end
    end
    return recipes_list
  end

  def self.get_recipe
  end

end

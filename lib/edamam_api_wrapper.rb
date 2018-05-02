require 'httparty'

class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.find_recipes(query)
    response = HTTParty.get("#{URL}?q=#{query}&app_id=#{ID}&app_key=#{KEY}")

    recipe_list = []

    if response["hits"] && response["count"] > 0
      response.parsed_response["hits"].each do |hit|
        recipe_list << Recipe.new(
          hit["recipe"]["label"],
          hit["recipe"]["uri"].match(/[^_]*$/),
          hit["recipe"]["image"],
          hit["recipe"]["source"],
          hit["recipe"]["url"],
          hit["recipe"]["ingredientLines"],
          hit["recipe"]["dietLabels"])
        end
    end

    return recipe_list
  end

end

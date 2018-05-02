require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEYS = ENV["EDAMAM_KEYS"]

  def self.list_recipes(term)
    response = HTTParty.get("#{URL}?q=#{term}&app_id=#{ID}&app_key=#{KEYS}")

    recipe_list = []

    if response["hits"]
      response["hits"].each do |hit|
        recipe_list << Recipe.new(
          hit["recipe"]["label"],
          hit["recipe"]["image"],
          hit["recipe"]["source"],
          hit["recipe"]["url"],
          hit["recipe"]["ingredientLines"],
          hit["recipe"]["dietLabels"]
        )
      end
    else
      return []
    end

    return recipe_list
  end
end

require 'httparty'

class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  KEY = ENV["EDAMAM_KEY"]
  ID = ENV["EDAMAM_ID"]
  RECIPE_URL = "http://www.edamam.com/ontologies/edamam.owl%23recipe_"

  def self.list_recipes(query)
    response = HTTParty.get("#{URL}?app_id=#{ID}&app_key=#{KEY}&q=#{query}&from=0&to=100")

    recipes_list = []

    if response["hits"]
      response["hits"].each do |hit|
      recipes_list << Recipe.new(hit["recipe"]["label"], hit["recipe"]["uri"], hit["recipe"]["image"])
      end
    end

    return recipes_list
  end

  def self.show_recipe(id)
    response = HTTParty.get("#{URL}?app_id=#{ID}&app_key=#{KEY}&r=#{RECIPE_URL}#{id}")
    if response[0]
      recipe =
      Recipe.new(
        response[0]["label"],
        response[0]["uri"],
        response[0]["image"],
        source: response[0]["source"],
        ingredients: response[0]["ingredientLines"],
        labels: response[0]["healthLabels"],
        url: response[0]["url"]
      )
      return recipe
    else
      return nil
    end
  end
end

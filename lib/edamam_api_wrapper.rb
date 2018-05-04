require 'httparty'

class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  @recipe_list = []

  def self.find_recipes(query)
    @recipe_list.clear

    response = HTTParty.get("#{URL}?q=#{query}&app_id=#{ID}&app_key=#{KEY}&to=50")
    # raise

    if response["hits"] && response["count"] > 0
      response.parsed_response["hits"].each do |hit|
        info_hash = {
          title: hit["recipe"]["label"],
          id: hit["recipe"]["uri"].match(/[^_]*$/)[0],
          image: hit["recipe"]["image"],
          source: hit["recipe"]["source"],
          url: hit["recipe"]["url"],
          portion: hit["recipe"]["yield"],
          ingredients: hit["recipe"]["ingredientLines"],
          diet: hit["recipe"]["dietLabels"]
        }

        @recipe_list << Recipe.new(info_hash)
      end
    end
    return @recipe_list
  end

  def self.find(id)
    @recipe_list.each do |recipe|
      return recipe if recipe.id == id
    end
  end

end

require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEYS = ENV["EDAMAM_KEYS"]
  @recipe_list = []

  def self.list_recipes(term)
    response = HTTParty.get("#{URL}?q=#{term}&app_id=#{ID}&app_key=#{KEYS}")

    # recipe_list = []

    if response["hits"]
      response["hits"].each do |hit|
        @recipe_list << Recipe.new(
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

    return @recipe_list
  end

  def self.find_recipe(title)
    @recipe_list.each do |recipe|
      if recipe.title == title
        return recipe
      end
    end
  end
end

require 'httparty'

class RecipeApiWrapper

  URL = "https://api.edamam.com/search"
  RPARAM = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  @recipes_list = []

  def self.find_recipes(search_terms)

    if !@recipes_list.empty?
      @recipes_list = []
    end

    encoded_search_terms = URI.encode(search_terms)
    response = HTTParty.get("#{URL}?q=#{encoded_search_terms}&app_id=#{ID}&app_key=#{KEY}&to=60")
    if response["hits"]
      response["hits"].each do |hit|
        @recipes_list << Recipe.new(hit["recipe"])
      end
    end
    return @recipes_list
  end

  def self.get_recipe(id)
    response = HTTParty.get("#{URL}?r=#{RPARAM}#{id}&app_id=#{ID}&app_key=#{KEY}")
    if response.empty?
      return nil
    else
      recipe = Recipe.new(response[0])
      return recipe
    end
  end

end

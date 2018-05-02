require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search?"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEYS"]

  @recipe_list = []

  def self.get_recipes(search)
    if !@recipe_list.empty?
      @recipe_list = []
    end

    encoded_uri = URI.encode("#{URL}q=#{search}&app_id=#{ID}&app_key=#{KEY}")

    response = HTTParty.get(encoded_uri)

    if response["hits"]
      response["hits"].each do |item|
        @recipe_list << Recipe.new(item["recipe"]["source"], item["recipe"]["label"], item["recipe"]["image"], item["recipe"]["uri"], item["recipe"]["ingredients"],
        item["recipe"]["yield"])
      end
    end
    return @recipe_list
  end

  def self.show_recipe(id)
    # recipe = @recipe_list.find {|item| item.id == chosen_id}
    # return recipe
    @recipe_list.each do |recipe|
      if recipe.id == id
        return recipe
      end
    end

  end

end

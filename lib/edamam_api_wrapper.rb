require 'httparty'

class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  @recipe_list = []

  def self.search_recipes

  end

  def self.list_all_recipes

  end

  def self.list_recipes(search)

    if !@recipe_list.empty?
      @recipe_list = []
    end

    encoded_uri =  URI.encode("#{URL}?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    response = HTTParty.get(encoded_uri)

    if response ["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe["recipe"])
      end
    end
    return @recipe_list

  end

  def self.show_recipe(uri)

    @recipe_list.each do |recipe|
      if recipe.uri == uri
        return recipe
      else
        return nil
      end
    end
  end
end

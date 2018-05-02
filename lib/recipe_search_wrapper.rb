require 'httparty'
require 'pry'

class RecipeSearchWrapper
  URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  @recipe_list = []

  def self.list_recipes(search)
    # uri endcode
    encoded_uri = URI.encode("#{URL}search?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    response = HTTParty.get(encoded_uri)

    @recipe_list = []
    if response["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe)
      end
    end
    return @recipe_list
  end

  def self.find_recipe(recipe_id)
    @recipe_list.each do |recipe|
      if recipe.id == recipe_id
        return recipe
      end
    end
    return nil
  end

end

require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  @recipes = []

  def self.list_recipes(ingredient)
    response = HTTParty.get("#{URL}?q=#{ingredient}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=100")

    @recipes = []

    if response["hits"]
      response["hits"].each do |recipe|
        @recipes << Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["uri"], recipe["recipe"]["ingredientLines"], recipe["recipe"]["image"], recipe["recipe"]["healthLabels"],
        recipe["recipe"]["url"],
        recipe["recipe"]["source"])
      end
    end
    return @recipes
  end

  def self.get_recipe(id)
    @recipes.each do |recipe|
      if recipe.get_id == id
        return recipe

      end
    end
  end
end

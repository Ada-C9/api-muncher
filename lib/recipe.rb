require 'pry'
class Recipe
  attr_reader :label, :image, :orig_url, :ingredients, :diet, :health, :uri, :id

  def initialize(recipe_data)
    @label = recipe_data[:label]
    @image = recipe_data[:image]
    @orig_url = recipe_data[:orig_url]
    @uri = recipe_data[:uri]
    @ingredients = recipe_data[:ingredients]
    @diet = recipe_data[:diet]
    @health = recipe_data[:health]
  end

  def self.from_api(response)
    recipe_data = {
    label: response["recipe"]["label"],
    image: response["recipe"]["image"],
    orig_url: response["recipe"]["url"],
    ingredients: response["recipe"]["ingredientLines"],
    diet: response["recipe"]["dietLabels"],
    health: response["recipe"]["healthLabels"],
    uri: response["recipe"]["uri"],
  }
    self.new(recipe_data)
  end

  def parse_ingredients(recipe)
  end

  def self.get_id(uri)
    return uri.split("owl")[1]
  end
end

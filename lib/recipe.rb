class Recipe
  attr_reader :name, :link, :image, :ingredients, :calories, :nutrients

  def initialize(name, link, image, ingredients, calories, nutrients)
    @name = name
    @link = link
    @image = image
    @ingredients = ingredients
    @calories = calories
    @nutrients = nutrients
  end

  def self.from_api(recipe_hash)
    self.new(recipe_hash["recipe"]["label"],
      recipe_hash["recipe"]["uri"],
      recipe_hash["recipe"]["image"],
      recipe_hash["recipe"]["ingredientLines"],
      recipe_hash["recipe"]["calories"]
    )
  end


end

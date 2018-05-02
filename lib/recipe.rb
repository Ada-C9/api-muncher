class Recipe
  attr_reader :recipe, :ingredients

  def initialize(recipe, ingredients, options = {})
    @recipe = recipe
    @ingredients = ingredients
  end
end

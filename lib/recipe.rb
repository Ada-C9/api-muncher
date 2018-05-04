class Recipe

  attr_reader :label, :uri, :image, :recipe_source, :url, :ingredientLines, :totalNutrients

  def initialize(recipe)
    @label = recipe["label"]
    @uri = recipe["uri"]
    @image = recipe["image"]
    @url = recipe["url"]
    @recipe_source = recipe["source"]
    @ingredientLines = recipe["ingredientLines"]
    @totalNutrients = recipe["totalNutrients"]
    @healthLabels = recipe["healthLabels"]
  end

end

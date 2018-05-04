class Recipe
attr_reader :label, :uri, :image, :recipe_source, :url, :ingredientLines, :totalNutrients, :healthLabels, :dietLabels

  def initialize(recipe)
    @uri = recipe["uri"].partition('_').last
    @label = recipe["label"]
    @image = recipe["image"]
    @url = recipe["url"]
    @recipe_source = recipe["recipe_source"]
    @ingredientLines = recipe["ingredientLines"]
    @totalNutrients = recipe["totalNutrients"]
    @healthLabels = recipe["healthLabels"]
    @dietLabels = recipe["dietLabels"]

  end
end

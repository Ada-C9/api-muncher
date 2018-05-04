class Recipe

  attr_reader :label, :uri, :image, :source, :url, :ingredientLines, :totalNutrients, :healthLabels, :id



  def initialize(recipe)
    @label = recipe["label"]
    @uri = recipe["uri"]
    @image = recipe["image"]
    @url = recipe["url"]
    @recipe_source = recipe["source"]
    @ingredientLines = recipe["ingredientLines"]
    @totalNutrients = recipe["totalNutrients"]
    @healthLabels = recipe["healthLabels"]

    split_uri = recipe["uri"].split("_")
    @id = split_uri.last
  end

end

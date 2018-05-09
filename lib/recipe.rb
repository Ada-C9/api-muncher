class Recipe

  attr_reader :label, :uri, :image, :source, :url, :ingredientLines, :totalNutrients, :id, :dietLabels

  def initialize(recipe)
    @label = recipe["label"]
    @uri = recipe["uri"]
    @image = recipe["image"]
    @url = recipe["url"]
    @source = recipe["source"]
    @ingredientLines = recipe["ingredientLines"]
    @totalNutrients = recipe["totalNutrients"]
    @dietLabels = recipe["dietLabels"]

    uri_split = @uri.split("_")

    @id = uri_split.last
  end



end

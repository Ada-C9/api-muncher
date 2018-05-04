class Recipe

  attr_reader :label, :uri, :image, :recipe_source, :url, :ingredients, :totalNutrients, :id

  def initialize(recipe)
    @label = recipe["label"]
    @uri = recipe["uri"]
    @image = recipe["image"]
    @url = recipe["url"]
    @recipe_source = recipe["recipe_source"]
    @ingredients = recipe["ingredients"]
    @totalNutrients = recipe["totalNutrients"]

    uri_split = @uri.split("_")

    @id = uri_split.last
  end



end

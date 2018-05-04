class Recipe
  attr_reader :name, :id, :image, :contributor, :ingredients, :dietary_labels, :health_labels, :url

  def initialize(recipe)
    @id = recipe["uri"].partition('_').last
    @name = recipe["label"]
    @image = recipe["image"]
    @contributor = recipe["source"]
    @ingredients = recipe["ingredientLines"].split(",").flatten
    @dietary_labels = recipe["dietLabels"]
    @health_labels = recipe["healthLabels"]
    @url = recipe["url"]
  end
end

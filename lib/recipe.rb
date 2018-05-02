class Recipe
  attr_reader :name, :id, :image, :contributer, :ingredients, :dietary_labels, :health_labels

  def initialize(recipe)
    @id = recipe["uri"].partition('_').last
    @name = recipe["label"]
    @image = recipe["image"]
    @contributer = recipe["source"]
    @ingredients = recipe["ingredientLines"]
    @dietary_labels = recipe["dietLabels"]
    @health_labels = recipe["healthLabels"]
  end
end

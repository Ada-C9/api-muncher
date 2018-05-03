class Recipe
  attr_reader :id, :name, :photo, :url, :source, :ingredients, :diet_labels, :health_labels
  def initialize(id, name, photo, url, source, ingredients, diet_labels, health_labels)
    @id = id
    @name = name
    @photo = photo
    @url = url
    @source = source
    @ingredients = ingredients
    @diet_labels = diet_labels
    @health_labels = health_labels
  end
end

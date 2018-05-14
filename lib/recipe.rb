class Recipe
  attr_reader :id, :name, :photo, :url, :source, :ingredients, :diet_labels, :health_labels
  def initialize(uri, name, photo, url, source, ingredients, diet_labels, health_labels)
    split_uri = uri.split("_")
    @id = split_uri.last
    @name = name
    @photo = photo
    @url = url
    @source = source
    @ingredients = ingredients
    @diet_labels = diet_labels
    @health_labels = health_labels
  end
end

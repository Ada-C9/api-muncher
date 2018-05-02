class Recipe
  attr_reader :title, :image, :source, :url, :ingredients, :diet_labels

  def initialize(title, image, source, url, ingredients, diet_labels)
    @title = title
    @image = image
    @source = source
    @url = url
    @ingredients = ingredients
    @diet_labels = diet_labels
  end

end

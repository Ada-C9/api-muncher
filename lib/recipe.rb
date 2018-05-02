class Recipe
  attr_reader :id, :title, :image, :source, :url, :ingredients, :diet_labels

  def initialize(uri, title, image, source, url, ingredients, diet_labels)
    @id = uri.last(32)
    @title = title
    @image = image
    @source = source
    @url = url
    @ingredients = ingredients
    @diet_labels = diet_labels
  end

end

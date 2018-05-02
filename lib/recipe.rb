class Recipe
  attr_accessor :name, :url, :ingredients, :image, :dietary_info

  def initialize(name, URI, ingredients, image, dietary_info)
    @name = name
    @uri = uri
    @ingredients = ingredients
    @image = image
    @dietary_info = dietary_info
  end
end

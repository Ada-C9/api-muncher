class Recipe
  attr_accessor :name, :uri, :ingredients, :image, :dietary_info

  def initialize(name, uri, ingredients, image, dietary_info)
    @name = name
    @uri = uri
    @ingredients = ingredients
    @image = image
    @dietary_info = dietary_info
  end
end

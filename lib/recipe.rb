class Recipe
  attr_reader :uri, :name, :ingredients, :image_url, :link

  def initialize(uri, name, ingredients, image_url, link)
    @name = name
    @uri = uri
    @ingredients = ingredients
    @image_url = image_url
    @link = link
  end

end

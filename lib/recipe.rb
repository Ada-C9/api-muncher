
class Recipe
  attr_reader :title, :id, :image, :source, :url, :ingredients, :diet

  def initialize(title, id, image, source, url, ingredients, diet, options = {})
    @title = title
    @id = id
    @image = image
    @source = source
    @url = url
    @ingredients = ingredients
    @diet = diet
  end

end

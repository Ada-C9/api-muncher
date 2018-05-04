
class Recipe
  attr_reader :title, :id, :image, :source, :url, :ingredients, :diet, :portion

  def initialize(title, id, image, source, url, portion, ingredients, diet, options = {})
    @title = title
    @id = id
    @image = image
    @source = source
    @url = url
    @portion = portion
    @ingredients = ingredients
    @diet = diet
  end

end

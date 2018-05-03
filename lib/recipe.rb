class Recipe
  attr_reader :id, :title, :image, :link, :source, :ingredients, :dietlabels

  def initialize(id, title, image, link, source, ingredients, dietlabels)
    @id = id
    @title = title
    @image = image
    @link = link
    @source = source
    @ingredients = ingredients
    @dietlabels = dietlabels
  end

end

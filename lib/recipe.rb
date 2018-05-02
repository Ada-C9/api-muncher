class Recipe
  attr_reader :id ,:name, :image, :url, :ingredients, :diatary_info

  def initialize(id, name, image)
    @id = id
    @name = name
    @image = image
  end
end

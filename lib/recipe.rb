class Recipe
  attr_reader :id, :title, :image

  def initialize(id, title, image, options = {})
    @title = title
    @id = id
    # @ingredients = ingredients
    # @dietlabels = dietlabels
    # @link = link
    @image = image
  end

end

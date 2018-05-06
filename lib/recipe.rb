class Recipe
  attr_reader :name, :uri, :image, :dietlabels, :ingredients, :source


  def initialize(name, uri, image, dietlabels, ingredients, source)

    @name = name
    @uri = URI.encode(uri)
    @image = image
    @dietlabels = dietlabels
    @ingredients = ingredients
    @source = source


  end

end

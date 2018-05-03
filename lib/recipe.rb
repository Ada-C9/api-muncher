class Recipe
  attr_reader :uri, :name, :ingredients

  def initialize(uri, name, ingredients)
    @name = name
    @uri = uri
    @ingredients = ingredients
  end

end

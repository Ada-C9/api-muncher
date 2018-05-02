class Recipe
  attr_reader :uri

  def initialize(recipe)
    @uri = recipe["uri"]
  end
end

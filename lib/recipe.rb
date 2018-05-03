class Recipe
  attr_reader :name, :link, :ingredients, :diet_info, :id

  def initialize(name, link, ingredients, diet_info, id)
    # should I raise an argument error here or when I supply the info to the class???
    raise ArgumentError if name == nil || name "" || id == nil || id "" || ingredients == nil || ingredients == ""

    @name = name
    @link = link
    @ingredients = ingredients
    @id = id
  end

end

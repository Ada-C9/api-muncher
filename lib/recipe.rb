class Recipe
  attr_reader :name, :uri

  # will probably end up needing more things
  def initialize(name: recipe_name, uri: recipe_uri)
    raise ArgumentError.new("Name can't be blank") if name.nil? || name.empty?
    raise ArgumentError.new("Uri can't be blank") if uri.nil? || uri.empty?

    @name = name
    @uri = uri
  end

  def self.from_api(raw_recipe)
    self.new(
      name: raw_recipe['label'],
      uri: raw_recipe['uri'],
      ingredients: raw_recipe['ingredientLines'],
      image: raw_recipe['image'],
      dietary_info: raw_recipe['totalNutrients']
    )
  end

end

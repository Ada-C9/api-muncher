class Recipe
  attr_reader :name, :uri

  # will probably end up needing more things
  def initialize(name: recipe_name, uri: recipe_uri)
    @name = name
    @uri = uri
  end

  def self.from_api(raw_recipes)
    self.new(
      name: raw_recipes['recipe']['label'],
      uri: raw_recipes['recipe']['uri']
    )
  end

end

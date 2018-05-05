class Recipe
  attr_reader :name, :uri, :image, :ingredients, :calories, :link, :source

  def initialize(name, uri, image, ingredients, calories, link, source)
    @name = name
    @uri = uri
    @image = image
    @ingredients = ingredients
    @calories = calories
    @link = link
    @source = source
    # @nutrients = nutrients
  end

  def self.from_api(recipe_hash)
    if recipe_hash
      self.new(recipe_hash["label"],
        recipe_hash["uri"],
        recipe_hash["image"],
        recipe_hash["ingredientLines"],
        recipe_hash["calories"],
        recipe_hash["url"],
        recipe_hash["source"]
      )
    end
  end

  def id
    return self.uri[-32..-1]
  end
end

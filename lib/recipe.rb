class Recipe
  attr_reader :label, :source, :image, :id, :ingredients, :count, :url, :health

  def initialize(label, source, image, uri, ingredients, count, url, health, options = {})
    @label = label
    @source = source
    @image = image
    @id = Recipe.parse_uri(uri)
    @ingredients = ingredients
    @count = count
    @url = url
    @health = health
  end

  def self.parse_uri(initial_uri)
    return initial_uri.split('_')[1].strip
  end

end

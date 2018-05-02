class Recipe
  attr_reader :label, :source, :image, :id, :ingredients, :count

  def initialize(label, source, image, uri, ingredients, count, options = {})
    @label = label
    @source = source
    @image = image
    @id = parse_uri(uri)
    @ingredients = ingredients
    @count = count
  end

  def parse_uri(initial_uri)
    return initial_uri.split('_')[1].strip
  end

end

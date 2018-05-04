class Recipe
  attr_reader :label, :image, :url, :ingredients, :nutrients

  def initialize(label, image, url, ingredient_lines, total_nutrients)
    @label = label
    @image = image
    @url = url
    @ingredients = ingredient_lines
    @nutrients = total_nutrients
  end

end

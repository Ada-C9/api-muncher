class Recipe

  attr_reader :uri, :name, :image, :link, :servings, :ingredients, :calories, :totalNutrients, :dietLabels, :healthLabels

  def initialize(uri, label, image, url, servings, ingredientList, options = {})
    @uri = URI.escape(uri)
    @name = label
    @image = image
    @link = url
    @servings = servings
    @ingredients = ingredientList
    @calories = options[:calories]
    @totalNutrients = options[:totalNutrients]
    @dietLabels = options[:dietLabels]
    @healthLabels = options[:healthLabels]
  end

end

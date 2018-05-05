class Recipe
  attr_reader :uri, :label, :image, :healthLabels, :ingredientLines
  def initialize(uri, label, image, healthLabels, ingredientLines)
    if label.nil? || label.empty?
      raise ArgumentError.new("need a recipe name please")
    end
    @uri = uri
    @label = label
    @image = image
    @healthLabels = healthLabels
    @ingredientLines = ingredientLines
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["uri"].split("_").last,
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredientLines"],
    )
  end
end

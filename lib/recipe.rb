
class Recipe
  attr_reader :uri, :label, :image, :url, :source, :healthLabels, :ingredientLines
  def initialize(uri, label, image, url, source, healthLabels, ingredientLines)
    if label.nil? || label.empty?
      raise ArgumentError.new("Need a recipe please")
    end

    @uri = uri
    @label = label
    @image = image
    @url = url
    @source = source
    @healthLabels = healthLabels
    @ingredientLines = ingredientLines
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["uri"].split("_").last,
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["url"],
      raw_recipe["source"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredientLines"]
    )
  end


end

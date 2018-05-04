class Recipe
  attr_reader :uri, :label, :image, :healthLabels, :ingredients
  def initialize(uri, label, image, healthLabels, ingredients)
    if label.nil? || label.empty?
      raise ArgumentError.new("Need a recipe please")
    end

    @uri = uri
    @label = label
    @image = image
    @healthLabels = healthLabels
    @ingredients = ingredients
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["uri"],
      raw_recipe["image"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredients"]
    )
  end


end

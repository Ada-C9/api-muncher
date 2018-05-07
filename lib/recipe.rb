class Recipe

  attr_reader :label, :image, :source, :url, :health_labels, :ingredients, :uri

  def initialize(label, image, source, url, healthLabels, ingredientLines, uri)
    # # Note that the below we used lazy evaluation to
    # # our advantage here
    # # Boolean logic short cercut
    if label.nil? || label.empty? || uri.nil?
      raise ArgumentError.new("Need a recipe to search")
    end

    @label = label
    @image = image
    @source = source
    @url = url
    @health_labels = healthLabels
    @ingredients = ingredientLines
    @uri = uri
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["source"],
      raw_recipe["url"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredientLines"],
      raw_recipe["uri"]
    )
  end
end

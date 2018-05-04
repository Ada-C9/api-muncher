class Recipe

  attr_reader :label, :image, :source, :url, :health_labels, :ingredients

  def initialize(label, image, source, shareAs, healthLabels, ingredientLines)
    # # Note that the below we used lazy evaluation to
    # # our advantage here
    # # Boolean logic short cercut
    if label.nil? || label.empty?
      raise ArgumentError.new("Need a recipe to search")
    end

    @label = label
    @image = image
    @source = source
    @url = shareAs
    @health_labels = healthLabels
    @ingredients = ingredientLines
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["source"],
      raw_recipe["shareAs"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredientLines"]
    )
  end
end

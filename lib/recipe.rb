class Recipe
  # paginates_per 8
  attr_reader :label, :image, :calories, :url, :uri, :ingredients, :health, :source

  def initialize(label, image, calories, url, uri, ingredients, health, source)
    @label = label
    @image = image
    @calories = calories
    @url = url
    @uri = uri
    @ingredients = ingredients
    @health = health
    @source = source
  end

  def self.from_api(raw_data)
    self.new(
    raw_data["label"],
    raw_data["image"],
    raw_data["calories"],
    raw_data["url"],
    raw_data["uri"],
    raw_data["ingredientLines"],
    raw_data["healthLabels"],
    raw_data["source"]
    )
  end


end

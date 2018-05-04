class Recipe
  # paginates_per 8
  attr_reader :label, :image, :calories, :url, :uri, :ingredients, :health

  def initialize(label, image, calories, url, uri, ingredients, health)
    @label = label
    @image = image
    @calories = calories
    @url = url
    @uri = uri
    @ingredients = ingredients
    @health = health
  end

  def self.from_api(raw_data)
    self.new(
    raw_data["label"],
    raw_data["image"],
    raw_data["calories"],
    raw_data["url"],
    raw_data["uri"],
    raw_data["ingredientLines"],
    raw_data["healthLabels"]
    )
  end


end

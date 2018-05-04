
class Recipe
  attr_reader :label, :image, :orig_url, :ingredients, :diet, :health, :uri, :source

  def initialize(recipe_data)
    # if label.nil? || label.empty?
    #   raise ArgumentError.new("Need a label please")
    # end
    @label = recipe_data[:label]
    @image = recipe_data[:image]
    @orig_url = recipe_data[:orig_url]
    @uri = recipe_data[:uri]
    @ingredients = recipe_data[:ingredients]
    @diet = recipe_data[:diet]
    @health = recipe_data[:health]
    @source = recipe_data[:source]
  end

  def self.from_api(response)
    recipe_data = {
      label: response["label"],
      image: response["image"],
      orig_url: response["url"],
      ingredients: response["ingredientLines"],
      source: response["source"],
      diet: response["dietLabels"],
      health: response["healthLabels"],
      uri: response["uri"],
    }
    self.new(recipe_data)
  end
end

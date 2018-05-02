class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :label, :url, :ingredients

  def initialize(label, url, ingredients)
    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end

    @label = label
    @url = url
    @ingredients = ingredients
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["recipe"]["label"],
      raw_recipe["recipe"]["url"],
      raw_recipe["recipe"]["ingredientLines"]
    )
  end
end

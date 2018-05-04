class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :uri, :label, :image, :url, :servings, :ingredients, :health_labels, :calories, :fat, :total_nutrients

  #this is a really annoying amount of arguments to require
  def initialize(
    uri,
    label,
    image,
    url,
    servings,
    ingredients,
    health_labels,
    calories,
    total_nutrients
  )


    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end

    if uri.nil? || uri.empty?
      raise ArgumentError.new("The recipe needs a URI")
    end

    @uri = uri
    @label = label
    @image = image
    @url = url
    @servings = servings
    @ingredients = ingredients
    @health_labels = health_labels
    @calories = calories
    @total_nutrients = total_nutrients

  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["uri"],
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["url"],
      raw_recipe["yield"],
      raw_recipe["ingredientLines"],
      raw_recipe["healthLabels"],
      raw_recipe["calories"],
      raw_recipe["totalNutrients"]
    )
  end

end

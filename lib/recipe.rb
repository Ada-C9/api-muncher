class Recipe
  attr_reader :uri, :label, :image, :source, :recipe_url, :ingredients, :calories, :healthLabels

  def initialize(label, options = {})
    if label.nil? || label.empty?
      raise ArgumentError.new("No name has been provided for this recipe")
    end

    if options.nil? || options.empty?
      raise ArgumentError.new("No details ")
    end

    @label = label
    @image =  options[:image]
    @source =  options[:source]
    @recipe_url =  options[:recipe_url]
    @uri = options[:uri]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @healthLabels = options[:healthLabels]
  end

  def self.format_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      {
        uri: raw_recipe["uri"],
        image: raw_recipe["image"],
        source: raw_recipe["source"],
        recipe_url: raw_recipe["url"],
        ingredients: raw_recipe["ingredients"],
        calories: raw_recipe["calories"],
        healthLabels: raw_recipe["healthLabels"]
      }
    )
  end
end

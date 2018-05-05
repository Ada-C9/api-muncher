class Recipe

  attr_reader :uri, :url, :label, :image, :healthlabels, :ingredientlines

  def initialize(uri, url, label, image, healthlabels, ingredientlines)

    if label.nil? || label.empty?
      raise ArgumentError.new('Need a food item')
    end

    @uri = uri
    @url = url
    @label = label
    @image = image
    @healthlabels = healthlabels
    @ingredientlines = ingredientlines

  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["uri"],
      raw_recipe["url"],
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["healthlabels"],
      raw_recipe["ingredientlines"]
  )
  end
end

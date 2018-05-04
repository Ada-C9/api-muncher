class Recipe

  attr_reader :url, :label, :image, :healthlabels, :ingredientlines

  def initialize(url, label, image, healthlabels, ingredientlines)

    if label.nil? || label.empty?
      raise ArgumentError.new('Need a food item')
    end

    @url = url
    @label = label
    @image = image
    @healthlabels = healthlabels
    @ingredientlines = ingredientlines

  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["url"],
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["healthlabels"],
      raw_recipe["ingredientlines"]
  )
  end
end

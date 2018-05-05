class Recipe

  attr_reader :uri, :url, :label, :image, :healthlabels, :ingredientlines

  def initialize(uri, url, label, image, healthlabels, ingredientlines)

    params_error(uri)
    params_error(url)
    params_error(label)
    params_error(image)
    params_error(healthlabels)
    params_error(ingredientlines)

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

  def params_error(param)
    if param.nil? || param.empty?
      raise ArgumentError.new("Missing #{param}")
    end
  end
end

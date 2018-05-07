class Recipe

  attr_reader :source, :uri, :url, :label, :image, :healthlabels, :ingredientlines

  def initialize(source, uri, url, label, image, healthlabels, ingredientlines)

    raise_error(uri)
    raise_error(url)
    raise_error(label)
    raise_error(image)

    @source = source
    @uri = uri
    @url = url
    @label = label
    @image = image
    @healthlabels = healthlabels
    @ingredientlines = ingredientlines
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["source"],
      raw_recipe["uri"].split('_')[1].strip,
      raw_recipe["url"],
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredientLines"]
  )
  end

  def raise_error(param)
    if param.nil? || param.empty?
      raise ArgumentError.new("Missing #{param}")
    end
  end

end

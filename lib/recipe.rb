class Recipe
  attr_accessor  :label, :image, :source, :uri, :healthLabels, :url, :ingredientLines
  def initialize(label, image, source, uri, healthLabels, url, ingredientLines )

    raise_error(label)
    raise_error(image)
    raise_error(source)
    raise_error(uri)
    raise_error(url)
    raise_error(ingredientLines)



    @label = label
    @image = image
    @source = source
    @uri = uri
    @healthLabels = healthLabels
    @url = url
    @ingredientLines = ingredientLines



  end

  def raise_error(param)
    if param.nil? || param.empty?
      raise ArgumentError.new("Need a #{param} please")
    end
  end


  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["source"],
      raw_recipe["uri"].split("_").last,
      raw_recipe["healthLabels"],
      raw_recipe["url"],
      raw_recipe["ingredientLines"]
    )
  end

end

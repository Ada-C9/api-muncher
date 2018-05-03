class Recipe

  attr_reader :url, :id, :label, :image

  def initialize(url, label, image, id)

    param_error(url)
    param_error(label)
    param_error(image)
    param_error(id)

    @id = id
    @label = label
    @url = url
    @image = image

  end

  def self.from_api(raw_recipe)
    self.new(
    raw_recipe["url"],
    raw_recipe["label"],
    raw_recipe["image"],
    raw_recipe["id"]
  )
  end

  def param_error(param)
    if param.nil? || param.empty?
      raise ArgumentError.new('Need a food item')
    end
  end

end

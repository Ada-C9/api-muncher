class Recipe
  attr_reader :label, :image, :uri
  def initialize(label, image, uri)
    valid_attribute(label)
    valid_attribute(image)
    valid_attribute(uri)

    @label = name
    @image = image
    @uri = uri.split(owl)
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["uri"]
    )

  end

  private

  def valid_attribute?(attribute)
    if attribute.nil? || attribute.empty?
      raise ArgumentError.new("Need a valid #{attribute}, please!")
    end
  end

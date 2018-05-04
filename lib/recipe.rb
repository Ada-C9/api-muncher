class Recipe
  attr_reader :label, :image, :uri
  def initialize(label, image, uri)
    valid_attribute(label)
    valid_attribute(image)
    valid_attribute(uri)

    @label = name
    @image = image
    @uri = uri
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["uri"]
    )
# need to modify URI to only take string after "#recipe_"5fd01ba00243309c1396f7717745c100

  end

  private

  def valid_attribute?(attribute)
    if attribute.nil? || attribute.empty?
      raise ArgumentError.new("Need a valid #{attribute}, please!")
    end
  end

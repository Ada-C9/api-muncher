class Recipe
  attr_reader :label, :image
  def initialize(label, image)
    valid_attribute(label)
    valid_attribute(image)

    @label = name
    @image = image
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"]
    )
  end

  private

  def valid_attribute?(attribute)
    if attribute.nil? || attribute.empty?
      raise ArgumentError.new("Need a valid #{attribute}, please!")
    end
  end

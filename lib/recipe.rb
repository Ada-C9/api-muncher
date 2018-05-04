class Recipe
  attr_reader :label, :image, :uri, :url, :ingredient_list, :nutrition_info
  def initialize(label, image, uri, url, ingredient_list, nutrition_info)
    valid_attribute(label)
    valid_attribute(image)
    valid_attribute(uri)

    @label = name
    @image = image
    @uri = uri.split(owl)
    @url = url
    @ingredient_list = ingredient_list
    @nutrition_info = nutrition_info
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["uri"],
      raw_recipe["url"],
      raw_recipe["ingreditensLines"],
      raw_recipe["totalNutrients"]
    )

  end

  private

  def valid_attribute?(attribute)
    if attribute.nil? || attribute.empty?
      raise ArgumentError.new("Need a valid #{attribute}, please!")
    end
  end

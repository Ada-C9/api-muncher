class Recipe
  attr_reader :label, :image, :uri, :url, :ingredient_list, :health_labels, :source
  def initialize(label, image, uri, url, ingredient_list, health_labels, source)
    valid_attribute?(label)
    valid_attribute?(image)
    valid_attribute?(uri)
    valid_attribute?(url)
    valid_attribute?(ingredient_list)
    valid_attribute?(health_labels)
    valid_attribute?(source)

    @label = label
    @image = image
    @uri = uri
    @url = url
    @ingredient_list = ingredient_list
    @health_labels = health_labels
    @source = source
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["uri"].split('_').last,
      raw_recipe["url"],
      raw_recipe["ingredientLines"],
      raw_recipe["healthLabels"],
      raw_recipe["source"]
    )

  end

  private

  def valid_attribute?(attribute)
    if attribute.nil? || attribute.empty?
      raise ArgumentError.new("Need a valid #{attribute}, please!")
    end
  end
end

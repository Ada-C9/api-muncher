class Recipe
  attr_reader :label

  def initialize(label)
    @label = label
  end

  def self.from_api(raw_recipe)
    self.new(raw_recipe["label"])
  end
end

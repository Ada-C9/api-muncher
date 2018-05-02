class Recipe
  attr_reader :label

  def initialize(label)
    raise ArgumentError if label == nil

    @label = label
  end

  def self.from_api(recipe)
    self.new(recipe["label"])
  end

end

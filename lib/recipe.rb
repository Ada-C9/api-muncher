class Recipe
  attr_reader :label

  def initialize(label)
    raise ArgumentError if label == nil

    @label = label

    # need to figure out how to populate r using recipe that's passed in via function below
    @r
  end

  def self.from_api(recipe)
    self.new(recipe["label"])
  end

end

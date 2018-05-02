class Recipe
  attr_reader :label

  def initialize(label, uri)
    raise ArgumentError if label == nil

    @label = label
    @uri = uri
  end

  def self.from_api(recipe)
    label = recipe["label"]
    uri = recipe["uri"]
    self.new(label, uri)
  end

end

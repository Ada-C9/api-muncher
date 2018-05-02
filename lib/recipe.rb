class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :label

  def initialize(label)
    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end
    
    @label = label
  end

  def self.from_api(raw_recipe)
    self.new(raw_recipe["recipe"]["label"])
  end
end

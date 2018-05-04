class Recipe
  attr_reader :image, :label, :source
  def initialize(image, label, source )
    # There is a better way to write this maybe using iteration?

    if image.nil? || image.empty?
      raise ArgumentError.new("Need a image please")
    end

    if label.nil? || label.empty?
      raise ArgumentError.new("Need a label please")
    end

    if source.nil? || source.empty?
      raise ArgumentError.new("Need a source please")
    end

    @image = image
    @label = label
    @source = source

  end

end

def self.from_api(raw_recipe)
    self.new(
      raw_recipe["image"],
      raw_recipe["label"],
      raw_recipe["source"]
    )
  end

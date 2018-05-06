class Recipe
  attr_accessor  :label, :image, :source
  def initialize(label, image, source )
    # There is a better way to write this maybe using iteration?
    raise_error(label)
    raise_error(image)
    raise_error(source)



    @label = label
    @image = image
    @source = source



  end

  def raise_error(param)
    if param.nil? || param.empty?
      raise ArgumentError.new("Need a #{param} please")
    end
  end


  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["source"]
    )
  end

end

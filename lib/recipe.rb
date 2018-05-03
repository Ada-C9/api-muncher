class Recipe

  attr_reader :label, :image

  def initialize(label, image, options = { })
    @label = label
    @image = image
  end

end

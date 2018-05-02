
class Recipe
  attr_reader :label, :uri, :image, :ingredients, :dietary_info

  def initialize(label, uri, options = { })
    @label = label
    @uri = uri
    @image = options[:image]
    @ingredient = options [:ingredients]
    @dietary_info = options[:dietary_info]

  end
end

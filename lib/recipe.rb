
class Recipe
  attr_reader :label, :uri, :image, :ingredients, :dietary_info

  def initialize(label, uri, options = { })
    raise ArgumentError if name.nil? || name.empty? || id.nil? || id.empty?

    @label = label
    @uri = uri
    @image = options[:image]
    @ingredients = options [:ingredients]
    @dietary_info = options[:dietary_info]

  end
end


class Recipe
  attr_reader :label, :uri, :image, :ingredients, :dietary_info, :source

  def initialize(label, uri, options = { })
    raise ArgumentError if label.nil? || label.empty? || uri.nil? || uri.empty?

    @label = label
    @uri = uri
    @image = options[:image]
    @source= options [:source]
    @ingredients = options [:ingredients]
    @dietary_info = options[:dietary_info]

  end
end

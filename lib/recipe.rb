
class Recipe
  attr_reader :label, :id, :image, :ingredients, :dietary_info, :source, :url

  def initialize(label, uri, options = { })

    @id = uri.last(32)
    @label = label
    @image = options[:image]
    @source= options [:source]
    @ingredients = options [:ingredients]
    @dietary_info = options[:dietary_info]
    @url = options [:url]
  end
end

class Recipe
  attr_reader :label, :uri, :options, :ingredients, :image, :diet, :url


  def initialize(label, uri, options = {})
    @label = label
    @uri = uri
    @url = options[:url]
    @ingredients = options[:ingredients]
    @image = options[:image]
    @diet = options[:diet]
  end

end

class Recipe

  attr_accessor :uri
  attr_reader :name, :image, :source, :source_url, :ingredient_lines, :diet_labels

  def initialize(name, image, uri, source, url, ingredient_lines, diet_labels )
    @name = name
    @image = image
    @uri = uri
    @source = source
    @source_url = url
    @ingredient_lines = ingredient_lines
    @diet_labels = diet_labels
  end

end

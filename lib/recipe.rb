class Recipe

  attr_reader :name, :id

  def initialize(label, image, uri, source, url, ingredient_lines, diet_labels )
    @name = label
    @image = image
    @uri = uri
    @source = source
    @source_url = url
    @ingredient_lines = ingredient_lines
    @diet_labels = diet_labels
  end

end

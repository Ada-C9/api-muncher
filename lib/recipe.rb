class Recipe
  attr_accessor :name, :uri, :ingredients, :image, :dietary_info,:url, :source, :id

  def initialize(name, uri, ingredients, image, dietary_info, url, source)
    @name = name
    @uri = uri
    @ingredients = ingredients
    @image = image
    @dietary_info = dietary_info
    @url = url
    @source = source
    @id = get_id
  end

  def get_id
    id = @uri.split('_')
    @id = id.last
  end
end

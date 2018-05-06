require 'httparty'
require 'pry'

class Recipe
  attr_reader :label, :image, :uri, :url, :ingredientLines, :id

  def initialize(label, image, uri, url, ingredientLines)
    @label = label
    @image = image
    @uri = uri
    @url = url
    @ingredientLines = ingredientLines
    @id = get_id
  end

  def get_id
    id = @uri.split('_')
    @id = id.last
  end

end

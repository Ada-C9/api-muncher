require 'httparty'
require 'pry'

class Recipe
  attr_reader :label, :image, :url, :ingredientLines

  def initialize(label, image, url, ingredientLines)
    # raise ArgumentError if label == nil || label == "" || url == nil || url == ""

    @label = label
    @image = image
    @url = url
    @ingredientLines = ingredientLines
  end

end

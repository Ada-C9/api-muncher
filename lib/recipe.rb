require 'will_paginate/array'

class Recipe
  attr_reader :uri, :label, :image, :source, :url, :yield, :calories, :totalWeight, :ingredients, :totalNutrients, :totalDaily, :dietLabels, :healthLabels

  def initialize(uri, label, options = {})
    @uri = uri
    @label = label
    @image = options[:image]
    @source = options[:source]
    @url = options[:url]
    @yield = options[:yield]
    @calories = options[:calories]
    @totalWeight = options[:totalWeight]
    @ingredients = options[:ingredients]
    @totalNutrients = options[:totalNutrients]
    @totalDaily = options[:totalDaily]
    @dietLabels = options[:dietLabels]
    @healthLabels =  options[:healthLabels]
  end

  def uri_trim
    return self.uri[/(?<=_)[a-zA-Z0-9]+/]
  end

end

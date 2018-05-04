require 'pry'
class Recipe
  attr_reader :label, :image, :source, :url

  def initialize(label, options = {})
    if label.nil? || label.empty?
      raise ArgumentError.new("No name has been provided for this recipe")
    end

    @label = label
    @image =  options[:image]
    @source =  options[:source]
    @recipe_url =  options[:url]
  end

  def self.format_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      {
        image: raw_recipe["image"],
        source: raw_recipe["source"],
        url: raw_recipe["url"]
      }
    )
  end
end

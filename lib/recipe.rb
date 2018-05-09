class Recipe
  #make the data that comes back from the API feel like a model, we are imitation the data the active record is sending, because an instance of a class is more managable for us.
  attr_reader :label, :image, :health, :ingredients, :url, :uri

  def initialize(label, image, health, ingredients, url, uri)
    #this is a lazy validation:

    if label.nil? || label.empty? || uri.nil? || uri.empty?
      raise ArgumentError.new("No recipe name")
    end
    @label = label
    @image = image
    @health = health
    @ingredients = ingredients
    @url = url
    @uri = uri
  end
  #this is a factory method, It resda the data we got back from the API, and turns it into an instance of channel by callinself.new

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["healthLabels"],
      raw_recipe["ingredientLines"],
      raw_recipe["url"],
      raw_recipe["uri"].split("_").last)
    end

  end

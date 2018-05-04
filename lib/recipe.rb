class Recipe

  attr_reader :id, :name, :image, :ingredients, :dietary_info, :url

  def initialize(id, name, image, ingredients, dietary_info, url)
    if name.nil? || name.empty?
      raise ArgumentError.new("Need a name please")
    end

    @id = id
    @name = name
    @image = image
    @ingredients = ingredients
    @dietary_info = dietary_info
    @url = url
  end

  def self.from_query_api(raw_recipe)
    self.new(
      raw_recipe["recipe"]["uri"].split("_")[1],
      raw_recipe["recipe"]["label"],
      raw_recipe["recipe"]["image"],
      raw_recipe["recipe"]["ingredientLines"],
      raw_recipe["recipe"]["dietLabels"],
      raw_recipe["recipe"]["url"]
    )
  end

  def self.from_recipe_api(raw_recipe)
    self.new(
      raw_recipe[0]["uri"].split("_")[1],
      raw_recipe[0]["label"],
      raw_recipe[0]["image"],
      raw_recipe[0]["ingredientLines"],
      raw_recipe[0]["dietLabels"],
      raw_recipe[0]["url"]
    )
  end
end

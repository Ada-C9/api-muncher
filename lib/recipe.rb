class Recipe

  attr_reader :id, :name, :image, :ingredients, :dietary_info, :health_info, :url

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @image = input[:image]
    @ingredients = input[:ingredients]
    @dietary_info = input[:dietary_info]
    @health_info = input[:health_info]
    @url = input[:url]

    if id.nil? || id.empty?
      raise ArgumentError.new("Recipe must have an id")
    end

    if name.nil? || name.empty?
      raise ArgumentError.new("Recipe must have a name")
    end
  end

  def self.from_query_api(raw_recipe)
    data = {
      id: raw_recipe["recipe"]["uri"].split("_")[-1],
      name: raw_recipe["recipe"]["label"],
      image: raw_recipe["recipe"]["image"],
      ingredients: raw_recipe["recipe"]["ingredientLines"],
      dietary_info: raw_recipe["recipe"]["dietLabels"],
      health_info: raw_recipe["recipe"]["healthLabels"],
      url: raw_recipe["recipe"]["url"]
    }
    self.new(data)
  end

  def self.from_recipe_api(raw_recipe)
    data = {
      id: raw_recipe[0]["uri"].split("_")[-1],
      name: raw_recipe[0]["label"],
      image: raw_recipe[0]["image"],
      ingredients: raw_recipe[0]["ingredientLines"],
      dietary_info: raw_recipe[0]["dietLabels"],
      health_info: raw_recipe[0]["healthLabels"],
      url: raw_recipe[0]["url"]
    }
    self.new(data)
  end
end

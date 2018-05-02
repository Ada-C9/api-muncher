class Recipe
  attr_reader :id ,:name, :image, :url, :ingredients, :dietary_info

  # def initialize(id, name, image)
  def initialize(recipe_hash)
    @id = parse_id(recipe_hash["recipe"]["uri"])
    @name = recipe_hash["recipe"]["label"]
    @image = recipe_hash["recipe"]["image"]
    @url = recipe_hash["recipe"]["url"]
    @ingredients = recipe_hash["recipe"]["ingredients"]
    @dietary_info = recipe_hash["recipe"]["dietLabels"]
  end

  def parse_id(uri)
    length = uri.length
    index = uri.index("_")
    return uri[index,length]
  end
end

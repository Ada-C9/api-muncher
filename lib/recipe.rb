class Recipe
  attr_reader :id ,:name, :source, :image, :url, :ingredients, :dietary_info

  def initialize(recipe_hash)
    @id = parse_id(recipe_hash["uri"])
    @name = recipe_hash["label"]
    @source = recipe_hash["source"]
    @image = recipe_hash["image"]
    @url = recipe_hash["url"]
    @ingredients = recipe_hash["ingredients"]
    @dietary_info = recipe_hash["dietLabels"]
  end

  # add logic to raise custom error if recipe hash is invalid

  def parse_id(uri)
    length = uri.length
    index = uri.index("_")
    return uri[index,length]
  end
end

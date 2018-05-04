class Recipe
  attr_reader :id ,:name, :source, :image, :url, :ingredients, :dietary_info

  def initialize(recipe_hash)
    @id = parse_id(recipe_hash["uri"])
    if @id
      @name = recipe_hash["label"]
      @source = recipe_hash["source"]
      @image = recipe_hash["image"]
      @url = recipe_hash["url"]
      @ingredients = recipe_hash["ingredients"]
      @dietary_info = recipe_hash["dietLabels"]
    else
      raise ArgumentError.new("Invalid Hash")
    end
  end

  def parse_id(uri)
    length = uri.length
    index = uri.index("_")
    if index
      return uri[index,length]
    else
      return nil
    end
  end
end

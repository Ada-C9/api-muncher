class Recsearch

  attr_reader :recipes, :query

  def initialize(query, recipe_list)
    @query = query
    self.load_recipes(recipe_list)
  end

  def load_recipes(list)
    @recipes = []
    list.each do |hash|
      @recipes << Recipe.new(hash["recipe"])
    end
  end

  def self.from_api(raw_data)
    self.new(
      raw_data["q"],
      raw_data["hits"]
    )
  end

end

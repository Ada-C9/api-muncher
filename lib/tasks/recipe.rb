class Recipe

  attr_reader :recipe, :id

  def initialize(recipe, id)

    if item.nil? || item.empty?
      raise ArgumentError.new('Need a food item')
    end
    @id = id
    @recipe = recipe
  end

  def self.from_api(raw_recipe)
    self.new(
    raw_recipe["recipe"],
    raw_recipe["id"]
  )
  end




end

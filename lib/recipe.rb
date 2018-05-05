class Recipe
  attr_reader :name, :uri, :image, :ingredients, :calories, :link, :source

  def initialize(name, uri, link, source, options = {})

    if [name, uri, link, source].any? { |param| param.nil? || param.empty? }
      raise ArgumentError.new("Could not create a recipe")
    end

    @name = name
    @uri = uri
    @link = link
    @source = source
    @image = options[:image]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    # @nutrients = nutrients
  end

  def self.from_api(recipe_hash)
    if recipe_hash
      self.new(recipe_hash["label"],
        recipe_hash["uri"],
        recipe_hash["url"],
        recipe_hash["source"],
        options = {
          image: recipe_hash["image"],
          ingredients: recipe_hash["ingredientLines"],
          calories:recipe_hash["calories"]}
        )
      end
    end

    def id
      return self.uri[-32..-1]
    end
  end

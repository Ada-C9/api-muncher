class Recipe
  # Add more fields as needed
  attr_reader :label, :image, :url, :uri, :ingredients, :healthlabels
  def initialize(recipe_response)
    # Note that we use lazy evaluation to our advantage here
    if recipe_response.nil? || recipe_response.empty?
      raise ArgumentError.new("What are you hungry for?")
    end
    @uri = recipe_response["uri"]
    @label = recipe_response["label"]
    @image = recipe_response["image"]
    @url = recipe_response["url"]
    @ingredients = recipe_response["ingredientLines"]
    @healthlabels = recipe_response["healthLabels"]
  end

  # This is a factory method! It reads the data
  # we got back from the API, and turns it into
  # an instance of Channel by calling self.new

end

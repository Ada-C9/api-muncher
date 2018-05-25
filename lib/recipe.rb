class Recipe
  attr_reader :uri, :name, :ingredients, :image_url, :link, :allergy, :nutrition, :query

  def initialize(uri, name, ingredients, image_url, link, allergy, nutrition, query= "no_query")
    @name = name
    @uri = uri
    @ingredients = ingredients
    @image_url = image_url
    @link = link
    @allergy = allergy
    @nutrition = nutrition
    @query = query
  end

end

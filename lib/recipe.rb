class Recipe

  attr_reader :name, :photo_url, :ingredients, :dietary_labels, :original_recipe_url, :uri_id

  def initialize(name, photo_url, ingredients, dietary_labels, original_recipe_url, uri_id)
    @name = name
    @photo_url = photo_url
    @ingredients = ingredients
    @dietary_labels = dietary_labels
    @original_recipe_url = original_recipe_url
    @uri_id = uri_id
  end

end

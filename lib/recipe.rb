class Recipe
  DEFAULT_IMAGE = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png"
  DEFAULT_INGREDIENTS = ['Ingredients Unavailable']

  attr_reader :name, :uri, :ingredients, :image, :dietary_info, :url

  def initialize(name: recipe_name, uri: recipe_uri, image: DEFAULT_IMAGE, ingredients: DEFAULT_INGREDIENTS, dietary_info: nil, url: recipe_url)

    raise ArgumentError.new("Name can't be blank") if name.nil? || name.empty?
    raise ArgumentError.new("Uri can't be blank") if uri.nil? || uri.empty?

    @name = name
    @uri = uri
    @image = image
    @ingredients = ingredients
    @dietary_info = dietary_info
    @url = url
  end

  def self.from_api(raw_recipe)
    self.new(
      name: raw_recipe['label'],
      uri: raw_recipe['uri'],
      ingredients: raw_recipe['ingredientLines'],
      image: raw_recipe['image'],
      dietary_info: raw_recipe['totalNutrients'],
      url: raw_recipe['url']
    )
  end

end

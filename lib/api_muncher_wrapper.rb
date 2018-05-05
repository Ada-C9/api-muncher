class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]


  @recipe_list = []

  def self.search_recipes(search)

    url = BASE_URL + "?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=30"
    data = HTTParty.get(url)

    if data["hits"]
      @recipe_list = []
      data["hits"].each do |hash|
        recipe = hash["recipe"]
        @recipe_list << Recipe.new(recipe["label"],
          recipe["uri"], {image: recipe ["image"],
            source: recipe['source'],
            url: recipe['url'],
            ingredients: recipe['ingredientLines'],
            dietary_info:recipe['dietLabels']}
          )
      end
      return @recipe_list
    end

  end

  def self.find_recipe(id)
    @recipe_list.each do |recipe|
      if recipe.id == id
        return recipe
      end
    end
    return nil
  end

end

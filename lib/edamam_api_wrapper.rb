class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  TOKEN = ENV["EDAMAM_TOKEN"]
  ID = ENV["EDAMAM_ID"]

  def self.recipe_search(terms)

    message_url = BASE_URL + "q=#{terms}&" + "app_id=#{ID}&" + "app_key=#{TOKEN}&to=50"

    response = HTTParty.get(message_url)

    recipes = []
    if response["hits"]
      response["hits"].each do |entry|
        label = entry["recipe"]["label"]
        uri = entry["recipe"]["uri"]
        image = entry["recipe"]["image"]
        recipes << Recipe.new(label, uri, options = { image: image })
      end
    end

    return recipes
  end

  def self.get_recipe(uri)
    terms = URI.encode(uri)
    message_url = BASE_URL + "r=#{terms}&" + "app_id=#{ID}&" + "app_key=#{TOKEN}&to=50"
    response = HTTParty.get(message_url)

    if response
      label = response[0]["label"]
      image = response[0]["image"]
        if image == nil
          image = "https://www.foodiesfeed.com/wp-content/uploads/2018/03/blueberries-heart-349x233.jpg"
        end
      url = response[0]["url"]
      ingredients = response[0]["ingredientLines"]
      diet = response[0]["healthLabels"]
      recipe = Recipe.new(label, uri, options = { image: image, url: url, ingredients: ingredients, diet: diet })
    end

    return recipe

  end

end

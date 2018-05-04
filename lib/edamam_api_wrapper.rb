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
        recipes << Recipe.new(label, uri)
      end
    end

    return recipes
  end

  def self.get_recipe
    terms = params[:id].encode
    message_url = BASE_URL + "r=#{terms}&" + "app_id=#{ID}&" + "app_key=#{TOKEN}&to=50"
    response = HTTParty.get(message_url)

    if response
      response[0]["hits"].each do |entry|
        label = response[0]["label"]
        image = response[0]["image"]
        url = response[0]["url"]
        ingredients = response[0]["ingredientLines"]
        nutrients = response[0]["totalNutrients"]
        @recipe = Recipe.new(label, uri, { image: image, url: url, ingredients: ingredients, nutrients: nutrients })
      end
    end
  end

end

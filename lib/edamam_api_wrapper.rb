class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  TOKEN = ENV["EDAMAM_TOKEN"]
  ID = ENV["EDAMAM_ID"]

  def self.find_it(terms)

    message_url = BASE_URL + "q=#{terms}&" + "app_id=#{ID}&" + "app_key=#{TOKEN}&to=50"
    response = HTTParty.get(message_url)

    recipes = []
    if response["hits"]
      response["hits"].each do |entry|
        label = entry["recipe"]["label"]
        image = entry["recipe"]["image"]
        url = entry["recipe"]["url"]
        ingredients = entry["recipe"]["ingredients"]
        nutrients = entry["recipe"]["nutrients"]
        recipes << Recipe.new(label, image, url, ingredients, nutrients)
      end
    end

    return recipes
  end

end

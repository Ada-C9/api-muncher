
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["APPLICATION_ID"]
  KEY = ENV["APPLICATION_KEY"]

  def self.list_recipes(key_words, start_index = nil)
    encoded_key_words = URI.encode(key_words)
    if !start_index
      response = HTTParty.get("#{BASE_URL}q=#{encoded_key_words}&app_id=#{ID}&app_key=#{KEY}")
    elsif start_index < 100
      response = HTTParty.get("#{BASE_URL}q=#{encoded_key_words}&app_id=#{ID}&app_key=#{KEY}&from=#{start_index}")
    elsif  start_index >= 100
      response = HTTParty.get("#{BASE_URL}q=#{encoded_key_words}&app_id=#{ID}&app_key=#{KEY}&from=#{90}")
    end
    recipe_search = {}
    if response["hits"]
      recipe_search[:recipe_list] = []
      if response["count"] < 100
        recipe_search[:page_count] = response["count"].to_i/10
      else
        recipe_search[:page_count] = 10
      end
      if !response["hits"].empty?
        response["hits"].each do | recipe |
          uri = recipe["recipe"]["uri"]
          name = recipe["recipe"]["label"]
          photo = recipe["recipe"]["image"]
          url = recipe["recipe"]["url"]
          source = recipe["recipe"]["source"]
          ingredients = recipe["recipe"]["ingredientLines"]
          diet_labels = recipe["recipe"]["dietLabels"]
          health_labels = recipe["recipe"]["healthLabels"]
          recipe_search[:recipe_list] << Recipe.new(uri, name, photo, url, source, ingredients, diet_labels, health_labels)
        end
      end
    end
    return recipe_search
  end

  def self.return_recipe(uri)
    response = HTTParty.get("#{BASE_URL}r=http:%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{uri}&app_id=#{ID}&app_key=#{KEY}")
    if !response.empty?
      uri = response[0]["uri"]
      name = response[0]["label"]
      photo = response[0]["image"]
      url = response[0]["url"]
      source = response[0]["source"]
      ingredients = response[0]["ingredientLines"]
      diet_labels = response[0]["dietLabels"]
      health_labels = response[0]["healthLabels"]
      return Recipe.new(uri, name, photo, url, source, ingredients, diet_labels, health_labels)
    end
  end

end

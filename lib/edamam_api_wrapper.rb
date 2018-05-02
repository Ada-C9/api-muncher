
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["APPLICATION_ID"]
  KEY = ENV["APPLICATION_KEY"]

  def self.list_recipes(key_words, search_range = [])
    encoded_key_words = URI.encode(key_words)
    response = HTTParty.get("#{BASE_URL}q=#{encoded_key_words}&app_id=#{ID}&app_key=#{KEY}")
    recipe_list = []
    if response["hits"]
      response["hits"].each do | recipe |
        recipe_list << recipe
      end
    end
    return recipe_list
  end

  # def self.return_recipe
  # end
end

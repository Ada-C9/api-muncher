require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEYS"]


  def self.get_recipes(search)
    encoded_uri = URI.encode("#{URL}search?q=#{search}&app_id=#{ID}&app_key=#{KEY}")

    response = HTTParty.get(encoded_uri)

    recipe_list = []
    if response["hits"]
      response["hits"].each do |entry|
        recipe_list << entry
      end
    end
    return recipe_list
  end
end

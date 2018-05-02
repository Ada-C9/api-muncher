require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/"
  ID = "032d2336"
  KEY = f5d02acbf83fb385394cb39dd26d6b59


  def self.get_recipes(search)
    response = HTTParty.get("#{URL}search?q=#{search}&app_id=#{ID}&app_key=#{KEY}")

    recipe_list = []

    if response["hits"]
      response["hits"].each do |entry|
        recipe_list << entry
      end
    end
    return recipe_list
  end
end

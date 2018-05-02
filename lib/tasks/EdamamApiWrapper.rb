require 'httparty'
require 'awesome_print'

class EdmamApiWrapper
  URL = "https://api.edamam.com/"

  ID = ENV["APP_ID"]
 KEY = ENV["APP_KEY"]


  def self.list_recipes(search)
    url = URL + "/search?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=#{page}"
    data = HTTParty.get(url).parsed_response
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << Recipe.new(recipe["recipe"]["label"])
      end
    end
    return recipe_list
  end


end

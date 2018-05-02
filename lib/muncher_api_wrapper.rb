require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["MUNCHER_APP_ID"]
  APP_KEY = ENV["MUNCHER_APP_KEY"]

  def self.create_recipe(api_params)
    return Recipe.new(api_params["label"])
  end

  def self.list_recipes(terms)
    url = "#{BASE_URL}?q=#{terms}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    recipe_list = []

    return response["hits"].map do |r|
      Recipe.from_api(r["recipe"])
    end
  end

  def self.show_recipe(recipe)
    url = BASE_URL + "?" + "r=#{recipe}" + "app_id=#{APP_ID}" + "app_key=#{APP_KEY}"
    response = HTTParty.get(url)

    # add conditional in case recipe not found
    return response[0]
  end

end

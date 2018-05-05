require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  BASE_SEARCH = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
  APP_ID = ENV["MUNCHER_APP_ID"]
  APP_KEY = ENV["MUNCHER_APP_KEY"]
  RESULTS = 80

  def self.create_recipe(api_params)
    return Recipe.new(api_params["label"])
  end

  def self.list_recipes(terms)
    url = "#{BASE_URL}?q=#{terms}&to=#{RESULTS}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    escaped = URI.escape(url)
    response = HTTParty.get(escaped)

    recipe_list = []
    response["hits"].each do |r|
      label_uri_image = {}
      label_uri_image[:label] = r["recipe"]["label"]
      # #recipe_ always has to be last # delimited item in uri otherwise this breaks
      label_uri_image[:id] = r["recipe"]["uri"].split("#recipe_")[-1]
      label_uri_image[:image] = r["recipe"]["image"]

      recipe_list << label_uri_image
    end
    return recipe_list
  end

  # doesn't work bc recipe needs to be the muncher r key
  # need to store this as an instance variable of the recipe
  def self.show_recipe(id)
    url = "#{BASE_URL}?r=#{BASE_SEARCH + id}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    escaped = URI.escape(url)
    response = HTTParty.get(escaped)

    recipe = Recipe.from_api(response[0])
    return recipe
  end

end

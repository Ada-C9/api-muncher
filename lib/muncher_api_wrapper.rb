require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  BASE_SEARCH = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]
  RESULTS = 80

  def self.list_recipes(terms)
    url = "#{BASE_URL}?q=#{terms}&to=#{RESULTS}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    escaped = URI.escape(url)
    response = HTTParty.get(escaped)

    recipe_list = []
    if response["hits"].nil?
      return recipe_list
    else
      response["hits"].each do |r|
        label_uri_image = {}
        label_uri_image[:label] = r["recipe"]["label"]
        # #recipe_ always has to be last # delimited item in uri otherwise this breaks
        label_uri_image[:id] = r["recipe"]["uri"].split("#recipe_")[-1]
        label_uri_image[:image] = r["recipe"]["image"]

        recipe_list << label_uri_image
      end
    end
    return recipe_list
  end

  def self.show_recipe(id)
    url = "#{BASE_URL}?r=#{BASE_SEARCH + id}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    escaped = URI.escape(url)
    response = HTTParty.get(escaped)

    if response.empty?
      return nil
    else
      return Recipe.from_api(response[0])
    end
  end

end

require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  BASE_SEARCH = "http://www.edamam.com/ontologies/edamam.owl#"
  APP_ID = ENV["MUNCHER_APP_ID"]
  APP_KEY = ENV["MUNCHER_APP_KEY"]

  def self.create_recipe(api_params)
    return Recipe.new(api_params["label"])
  end

  def self.list_recipes(terms)
    url = "#{BASE_URL}?q=#{terms}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    escaped = URI.escape(url)
    response = HTTParty.get(escaped)

    recipe_list = []
    response["hits"].each do |r|
      label_and_uri = {}
      label_and_uri[:label] = r["recipe"]["label"]
      # #recipe_ always has to be last item in
      label_and_uri[:id] = r["recipe"]["uri"].split("#")[-1]

      recipe_list << label_and_uri
    end
    return recipe_list
  end

  # doesn't work bc recipe needs to be the muncher r key
  # need to store this as an instance variable of the recipe
  def self.show_recipe(id)
    url = "#{BASE_URL}?r=#{BASE_SEARCH + id}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    escaped = URI.escape(url)
    response = HTTParty.get(escaped)

    

    return "???"
  end

end

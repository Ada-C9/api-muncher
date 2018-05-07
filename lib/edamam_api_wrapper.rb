require 'httparty'

class EdamamApiWrapper
  class EdamamError < StandardError; end

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_API_ID"]
  KEY = ENV["EDAMAM_API_KEY"]

  def self.list_recipes(query)
    full_url = URI.encode(BASE_URL + "?q=" + query + "&app_id=" + ID + "&app_key=" + KEY + "&from=0&to=50")

    response = HTTParty.get(full_url)

    raise_on_error(response)

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe['recipe'])
    end
  end

  def self.display_recipe(uri)
    full_url = URI.encode(BASE_URL + "?r=http://www.edamam.com/ontologies/edamam.owl#recipe_" + uri + "&app_id=" + ID + "&app_key=" + KEY)

    response = HTTParty.get(full_url)

    raise_on_error(response)

    return Recipe.from_api(response[0])

  end

  private
  def self.raise_on_error(response)
    unless response["more"]
      raise EdamamError.new(response["error"])
    end
  end

end

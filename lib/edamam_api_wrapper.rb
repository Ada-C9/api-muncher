require 'httparty'

class EdamamApiWrapper
  class EdamamError < StandardError; end

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_API_ID"]
  KEY = ENV["EDAMAM_API_KEY"]

  def self.list_recipes(query)
    full_url = URI.encode(BASE_URL + "?q=" + query + "&app_id=" + ID + "&app_key=" + KEY + "&from=0&to=50")

    response = HTTParty.get(full_url).parsed_response

    raise_on_error(response)

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe)
    end
  end

  def self.display_recipe
    full_url = URI.encode(BASE_URL + "?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_" + uri + "&app_id=" + ID + "&app_key=" + KEY)

    response = HTTParty.get(full_url).parsed_response

    raise_on_error(response)

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe)
    end

  end

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise EdamamError.new(response["error"])
    end
  end

end

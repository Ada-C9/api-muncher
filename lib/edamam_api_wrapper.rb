require 'httparty'
require 'pry'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]

  @from = 0
  @to = 200

  def self.list_of_recipes(search_term, app_id = nil, app_key = nil)
    app_id ||= EDAMAM_ID
    app_key ||= EDAMAM_KEY

    url = BASE_URL + "q=" + search_term + "&app_id=#{app_id}" + "&app_key=#{app_key}" + "&from=#{@from}" + "&to=#{@to}"

    data = HTTParty.get(url)

    if data["hits"]
      my_recipes = data["hits"].map do |hit|
        options = {
          ingredientLines: hit["recipe"]["ingredientLines"],
          dietLabels: hit["recipe"]["dietLabels"], image: hit["recipe"]["image"],
          source: hit["recipe"]["source"]
        }

        Recipe.new(
          hit["recipe"]["uri"].split("_").last,
          hit["recipe"]["label"],
          hit["recipe"]["url"],
          options
        )
      end
      return my_recipes
    else
      return [] #or return nil?
    end

  end #self.list_recipes

  def self.show_recipe(uri,app_id = nil, app_key = nil)
    app_id ||= EDAMAM_ID
    app_key ||= EDAMAM_KEY
    # uri = uri.gsub!(/#/, '%20') if uri.include?('#')
    # # uri = URI.encode(uri)

    url = BASE_URL + "r=" + "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_" + uri + "&app_id=#{app_id}" + "&app_key=#{app_key}"

    # cuando parsed_response?
    data = HTTParty.get(url)

    if data.body == '['
      return nil
    end

    if data[0] == nil
      return nil
    end

    options = {
      ingredientLines: data[0]["ingredientLines"],
      dietLabels: data[0]["dietLabels"], image: data[0]["image"],
      source: data[0]["source"]
    }

    Recipe.new(
      uri,
      data[0]["label"],
      data[0]["url"],
      options
    )

  end #show recipe
end #of class

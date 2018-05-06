require 'httparty'

class EdamamApiWrapper

  SEARCH_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["APPLICATION_ID"]
  APP_KEY = ENV["APPLICATION_KEY"]
  R_SEARCH_DRESSING = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_" # This is the encoded https into that Edamam wants as a leader for the recipe's ID number for doing an 'r' search.

  def self.recipe_search_result(query)
    list_response = HTTParty.get("#{SEARCH_URL}q=#{query}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=40")
    recipe_list = []
    if list_response["hits"]
      list_response["hits"].each do |hit|
        @recipe =  Recipe.new(hit["recipe"]["label"], hit["recipe"]["image"], hit["recipe"]["uri"], hit["recipe"]["source"], hit["recipe"]["url"], hit["recipe"]["ingredientLines"], hit["recipe"]["dietLabels"])
        recipe_list << @recipe
      end
    else
      return []
    end
    return recipe_list
  end

  def self.specific_recipe(target_uri)
    form_encoded_recipe_URI = CGI::escape(target_uri)
    recipe_response = HTTParty.get("#{SEARCH_URL}app_id=#{APP_ID}&app_key=#{APP_KEY}&r=#{form_encoded_recipe_URI}")
    if !recipe_response.empty?
      target_recipe = Recipe.new(recipe_response[0]["label"], recipe_response[0]["image"], recipe_response[0]["uri"], recipe_response[0]["source"], recipe_response[0]["url"], recipe_response[0]["ingredientLines"], recipe_response[0]["dietLabels"])
    else
      target_recipe = nil
    end
    return target_recipe
  end

end

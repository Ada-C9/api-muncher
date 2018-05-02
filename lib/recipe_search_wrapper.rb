require 'httparty'
require 'pry'

class RecipeSearchWrapper
  class RecipeError < StandardError; end

  def self.search_recipes
    app_id = ENV["APPLICATION_ID"]
    app_key = ENV["APPLICATION_KEY"]

    # encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=" + query)

    encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=chicken")

    response = HTTParty.get(encoded_uri).parsed_response

    #response["hits"][0]["recipe"]["label"] => teriyaki chicken

    #raw_recipe["recipe"]["label"] => teriyaki chicken

    return response["hits"].map do |raw_recipe|
      recipe = raw_recipe["recipe"]
      Recipe.from_api(recipe)
    end
  end


    # recipes.each do |recipe|
    #   puts recipe["label"]
    # end
    # return nil

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise RecipeError.new(response["error"])
    end
  end

end

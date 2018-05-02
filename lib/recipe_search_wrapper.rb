require 'httparty'
require 'pry'

class RecipeSearchWrapper
  def self.search_recipes
    app_id = ENV["APPLICATION_ID"]
    app_key = ENV["APPLICATION_KEY"]

    # encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=" + query)
    # encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=chicken")
    encoded_uri = URI.encode("https://api.edamam.com/search?app_id=1a49a2ef&app_key=ff92823167ff0188041474d1d4db2aef&q=chicken")

    response = HTTParty.get(encoded_uri).parsed_response

    # unless response["ok"]
    #   raise StandardError.new(response["error"])
    # end
    # binding.pry
    # response["hits"][0]["recipe"]["label"] => teriyaki chicken

    return response["hits"].map do |raw_recipe|
      binding.pry
      Recipe.from_api(raw_recipe)
    end


    # recipes.each do |recipe|
    #   puts recipe["label"]
    # end
    # return nil

  end
end

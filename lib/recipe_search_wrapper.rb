require 'httparty'
require 'pry'

class RecipeSearchWrapper
  def self.search_recipes
    app_id = ENV["APPLICATION_ID"]
    app_key = ENV["APPLICATION_KEY"]

    # encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=" + query)

    encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=chicken")

    response = HTTParty.get(encoded_uri).parsed_response

    # unless response["ok"]
    #   raise StandardError.new(response["error"])
    # end

    # binding.pry

    #response["hits"][0]["recipe"]["label"] => teriyaki chicken

    #raw_recipe["recipe"]["label"] => teriyaki chicken

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe)
    end


    # recipes.each do |recipe|
    #   puts recipe["label"]
    # end
    # return nil

    # private
    # def self.raise_on_error(response)
    #   unless response["ok"]
    #     raise #SlackError.new(response["error"])
    #   end
    # end

  end
end

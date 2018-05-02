require 'httparty'
require 'pry'

class RecipeSearchWrapper
  def search_recipes(query)
    app_id = ENV["APPLICATION_ID"]
    app_key = ENV["APPLICATION_KEY"]

    encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&q=" + query)

    response = HTTParty.get(encoded_uri).parsed_response

    recipes = response["hits"]

    recipes.each do |recipe|
      puts recipe["label"]
    end
    return nil

  end
end

search_recipes("chicken")

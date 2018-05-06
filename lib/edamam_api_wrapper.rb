require 'httparty'
require 'will_paginate'


  class EdamamApiWrapper

    BASE_URL = "https://api.edamam.com/"
    APP_ID = ENV["APP_ID"]
    APP_KEY = ENV["APP_KEY"]


    def self.list_recipes(query)
      url = BASE_URL + "search?q=#{query}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
      data = HTTParty.get(url)
      my_recipes = []

      if data["hits"]
      data["hits"].each do |recipe_hash|
      my_recipes << Recipe.new(recipe_hash["recipe"]["label"],
          recipe_hash["recipe"]["uri"],
          recipe_hash["recipe"]["image"],
          recipe_hash["recipe"]["dietLabels"],
          recipe_hash["recipe"]["ingredients"],
          recipe_hash["recipe"]["source"]
        )
        end
        return my_recipes
      else
        return []
      end
    end

    def self.get_recipe(uri)
      url = BASE_URL + "search?r=#{uri}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
      data = parsed_response(HTTParty.get(url))
      puts data
      return nil if data.nil?

    recipe =  Recipe.new(data.first["label"],
      data.first["uri"],
      data.first["image"],
      data.first["dietLabels"],
      data.first["ingredientLines"],
      data.first["source"]
    )
    return recipe

    end

    private

    def self.parsed_response(response)
      return response.parsed_response rescue nil
    end

end

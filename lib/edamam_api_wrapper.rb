require 'httparty'
require 'will_paginate'




class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV['APP_ID']
  APP_KEY = ENV['APP_KEY']

  def self.list_recipes(query)
    recipe_results = []

    url = BASE_URL + "search?&q=#{query}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    data = HTTParty.get(url)

    if data["hits"]
      data["hits"].each do |recipe_hash|
        recipe_results<< Recipe.new( recipe_hash["recipe"]["label"],
          recipe_hash["recipe"]["uri"],
          recipe_hash["recipe"]["image"],
          recipe_hash["recipe"]["dietLabels"],
          recipe_hash["recipe"]["healthLabels"],
          recipe_hash["recipe"]["source"]
        )
      end
        return recipe_results
      else
        return []
      end

    end

    def self.get_recipe(uri)
      url = BASE_URL + "search?&r=#{uri}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
      data = HTTParty.get(url)
      puts data
      return nil if data.nil?

      Recipe.new data.first["label"],
      data.first["uri"],
      data.first["image"],
      data.first["dietLabels"],
      data.first["ingredientLines"],
      data.first["source"]

    end


  end

require 'edamam-ruby'
require 'httparty'


class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  @recipe_list = []

  def self.search_recipes

  end

  def self.list_all_recipes

  end

  def self.list_recipes(search)

    response = HTTParty.get("#{URL}?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    if response ["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe["recipe"])
      end
    end
    return @recipe_list
  end
end

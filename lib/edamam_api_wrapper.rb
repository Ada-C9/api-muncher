require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(user_input)
    response = HTTParty.get("#{URL}search?q=#{user_input}&app_id=#{ID}&app_key=#{KEY}")

    recipes_list = []

    if response['hits']
      response['hits'].each do |recipe|
        recipes_list << Recipe.new(recipe['recipe']['uri'][-10..-1], recipe['recipe']['label'], recipe['recipe']['image'])
      end
    end
    return recipes_list
  end

  def self.show_recipe

  end

end

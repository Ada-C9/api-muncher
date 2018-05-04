require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(user_input)
    response = HTTParty.get("#{URL}search?q=#{user_input}&app_id=#{ID}&app_key=#{KEY}&from=0&to=50")

    recipes_list = []

    if response['hits']
      response['hits'].each do |recipe|
        recipes_list << Recipe.new(recipe['recipe']['uri'], recipe['recipe']['label'], recipe['recipe']['image'], recipe['recipe']['url'], recipe['recipe']['source'], recipe['recipe']['ingredients'], recipe['recipe']['dietLabels'])
      end
    end
    return recipes_list
  end

  def self.show_recipe(id)
    response = HTTParty.get(URI.encode("#{URL}search?r=#{id}&app_id=#{ID}&app_key=#{KEY}"))

    response = Recipe.new(response[0]['uri'], response[0]['label'], response[0]['image'], response[0]['url'], response[0]['source'], response[0]['ingredients'], response[0]['dietLabels'])

    return response
  end
end

require 'httparty'
require 'awesome_print'



class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV['APP_ID']
  APP_KEY = ENV['APP_KEY']

  def self.list_recipes(query)
    recipe_list = []

   url = BASE_URL + "?q=#{query}" + "&app_id=#{APP_ID}&app_key=#{token}"

   data = HTTParty.get(url)

   if data["hits"]
     my_recipes = data["hits"].map do |recipe_hash|
       Recipe.new recipe_hash["recipe"]["label"],
       recipe_hash["recipe"]["uri"],
       recipe_hash["recipe"]["image"],
       recipe_hash["recipe"]["dietLabels"],
       recipe_hash["recipe"]["healthLabels"],
       recipe_hash["recipe"]["cautions"],
       recipe_hash["recipe"]["calories"]
     end  
     return my_recipes
   else
     return []
   end
 end

 def self.get_recipe(id)
   url = BASE_URL + "?r=#{uri}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
   data = parsed_response(HTTParty.get(url))
   ap data
   return nil if data.nil?

   Recipe.new data.first["label"],
   data.first["uri"],
   data.first["image"],
   data.first["dietLabels"],
   data.first["ingredientLines"],
   data.first["source"],
   data.first["url"]
 end

 private

 def self.parsed_response(response)
   return response.parsed_response rescue nil
 end
end

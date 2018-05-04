require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  URL2 = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]



  def self.list_recipes(ingredient)
    response = HTTParty.get("#{URL}?q=#{ingredient}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=100")

    recipes = []

    if response["hits"]
      response["hits"].each do |recipe|
        recipes << Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["uri"], recipe["recipe"]["ingredientLines"], recipe["recipe"]["image"], recipe["recipe"]["healthLabels"],
          recipe["recipe"]["url"],
          recipe["recipe"]["source"])
        end
      end
      return recipes
    end

    def self.get_recipe(id)
      encode = URI.encode("#{URL}?r=#{URL2}#{id}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

      response = HTTParty.get(encode)

      if response == []
        return nil
      else

        recipe = Recipe.new(response[0]["label"], response[0]["uri"], response[0]["ingredientLines"], response[0]["image"], response[0]["healthLabels"], response[0]["url"], response[0]["source"])

        return recipe
      end
    end
  end

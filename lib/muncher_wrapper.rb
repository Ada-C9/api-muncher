require 'httparty'

class MuncherWrapper
  URL = "https://api.edamam.com/search"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]


  def self.get_recipes(search_phrase)
    return [] if search_phrase.blank?

    @recipe_list = []

    encoded_uri = URI.encode("#{URL}?q=#{search_phrase}&app_id=#{ID}&app_key=#{KEY}&to=100")

    response = HTTParty.get(encoded_uri)

    if response["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe["recipe"])
      end
    end

    return @recipe_list

  end


  def self.show_recipe(uri)

    url = URI.encode("#{URL}?r=#http:%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{uri}&app_id=#{ID}&app_key=#{KEY}")

    response = HTTParty.get(url)
    #raise
    if response != nil

      attributes = {}
        attributes["label"] = response[0]["label"]
        attributes["uri"] = response[0]["uri"]
        attributes["image"] = response[0]["image"]
        attributes["url"] = response[0]["url"]
        attributes["source"] = response[0]["source"]
        attributes["ingredientLines"] = response[0]["ingredientLines"]
        attributes["diet_labels"] = response[0]["dietLabels"]
        attributes["total_nutrients"] = response[0]["totalNutrients"]
        attributes["health_labels"] = response[0]["healthLabels"]


      recipe = Recipe.new(attributes)
    else
      return nil
    end
    #raise
    return recipe
  end



end

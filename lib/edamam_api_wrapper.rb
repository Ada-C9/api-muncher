require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  APP_KEY = ENV["APPLICATION_KEY"]
  APP_ID = ENV["APPLICATION_ID"]


# postman template
 # https://test-es.edamam.com/search?q=noodles&app_key=97680b5b553222cff5288b9d110d55ed&app_id=ee889654
  def self.list_recipes(search_term)
    return [] if search_term.blank?

    encoded_uri = URI.encode("#{URL}?q=#{search_term}&app_id=#{APP_ID}&app_key=#{APP_KEY}&to=100")

    puts encoded_uri

    response = HTTParty.get(encoded_uri)

    @recipe_list = []

    if response["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe["recipe"])
      end
    end

    return @recipe_list

  end

  def self.show_recipe(id)
    # return [] if uri.blank?

    encoded_uri = "#{URL}?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    puts encoded_uri

    response = HTTParty.get(encoded_uri)

    if !response.nil?
      recipe_hash = {}
      recipe_hash["label"] = response[0]["label"]
      recipe_hash["uri"] = response[0]["uri"]
      recipe_hash["image"] = response[0]["image"]
      recipe_hash["url"] = response[0]["url"]
      recipe_hash["source"] = response[0]["source"]
      recipe_hash["ingredientLines"] = response[0]["ingredientLines"]
      recipe_hash["totalNutrients"] = response[0]["totalNutrients"]
      recipe_hash["dietLabels"] = response[0]["dietLabels"]

      recipe = Recipe.new(recipe_hash)
    else
      return nil
    end
    return recipe
  end
end

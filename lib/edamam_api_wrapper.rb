require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(q)
    url = "#{URL}?q=#{q}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    response = HTTParty.get(url)

    recipes = []
    if response["hits"]
      response["hits"].each do |hit|
        recipe = self.create_recipe_from_response(hit["recipe"])
        recipes << recipe
      end
    end
    return recipes
  end

  def self.find_by_uri(uri)
    url = "#{URL}?r=#{uri}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    response = HTTParty.get(url)
    return nil if response.blank?
    return create_recipe_from_response(response.first)
  end

  def self.create_recipe_from_response(response_recipe)
    print response_recipe
    Recipe.new(
      label: response_recipe["label"],
      uri: URI.encode(response_recipe["uri"], /\W/),
      url: response_recipe["url"],
      image: response_recipe["image"],
      source: response_recipe["source"],
      ingredient_lines: response_recipe["ingredientLines"],
      diet_labels: response_recipe["dietLabels"],
      health_labels: response_recipe["healthLabels"]
    )
  end
end

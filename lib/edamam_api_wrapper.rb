class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  BASE_URI = "http://www.edamam.com/ontologies/edamam.owl%23recipe_"
  APP_ID = ENV["EDAMAN_ID"]
  APP_KEY = ENV["EDAMAN_KEY"]

  def self.search_recipes(q)
    url = BASE_URL + "?q=#{q}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    response = HTTParty.get(url)
    found_recipes = []
    if response["hits"]
      response["hits"].each do |recipe_info|
        found_recipes << get_recipe(recipe_info["recipe"])
      end
    end
    return found_recipes
  end

  def self.get_recipe(hit)
    return Recipe.new(
      hit["uri"],
      hit["label"],
      options = {
        image: hit["image"],
        source: hit["source"],
        url: hit["url"],
        yield: hit["yield"],
        calories: hit["calories"],
        totalWeight: hit["totalWeight"],
        ingredients: hit["ingredients"],
        totalNutrients: hit["totalNutrients"],
        totalDaily: hit["totalDaily"],
        dietLabels: hit["dietLabels"],
        healthLabels: hit["healthLabels"],
      }
    )
  end

  def self.show_recipe(uri_trim)
    url = BASE_URL + "?r=" + BASE_URI + "#{uri_trim}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    response = HTTParty.get(url)
    recipe = get_recipe(response[0])
    return recipe
  end
end

require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://test-es.edamam.com/search"

  def self.list_recipes(search_term)
    url = BASE_URL + "?q=#{ search_term }"
    data = HTTParty.get(url)
    recipe_list = []
    if data['hits']
      data['hits'].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end

  private
  def self.create_recipe(api_params)
    recipe = api_params['recipe']
    return Recipe.new(
      recipe['label'],
      recipe['image'],
      recipe['ingredientLines'],
      recipe['dietLabels'],
      recipe['url']
    )
  end

end # EdamamApiWrapper

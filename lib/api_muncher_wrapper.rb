require 'httparty'

class ApiMuncherWrapper
  BASE_URL = "https://test-es.edamam.com/search"
  APPLICATION_ID = ENV["APPLICATION_ID"]
  APPLICATION_KEYS = ENV["APPLICATION_KEYS"]

  # This sends a get request with my search word etc to the API and gets a JSON that will be used to create new recipe instances
  def self.get_recipes(query)
    recipes = []
    return recipes if query.nil?

    url = "#{BASE_URL}?q=#{query}&app_id=#{APPLICATION_ID}&app_key=#{APPLICATION_KEYS}"
    data = HTTParty.get(url)

    data["hits"].each do |hit|

      uri = hit["recipe"]["uri"]
      name = hit["recipe"]["label"]
      ingredients = hit["recipe"]["ingredientLines"]

      recipes << Recipe.new(uri, name, ingredients)
    end

    return recipes
  end

# From and to to get paging done
end

require 'httparty'
require 'pry'

class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APPLICATION_ID = ENV["APPLICATION_ID"]
  APPLICATION_KEYS = ENV["APPLICATION_KEYS"]

  # This sends a get request with my search word etc to the API and gets a JSON that will be used to create new recipe instances
  def self.get_recipes(query, page)
    recipes = []
    all_recipes_info = []

    return recipes if query.nil?

    url = "#{BASE_URL}?q=#{query}&app_id=#{APPLICATION_ID}&app_key=#{APPLICATION_KEYS}&from=#{page}"
    data = HTTParty.get(url)

    # is this better as a hash????
    # ????
    # how many recipes there are that match the querry
    all_recipes_info << data["count"]


    data["hits"].each do |hit|
      uri = hit["recipe"]["uri"]
      name = hit["recipe"]["label"]
      ingredients = hit["recipe"]["ingredientLines"]
      image_url = hit["recipe"]["image"]
      link = hit["recipe"]["url"]
      allergy = hit ["recipe"]["healthLabels"]
      nutrition = hit ["recipe"]["dietLabels"]

      recipes << Recipe.new(uri, name, ingredients, image_url, link, allergy, nutrition, query)
    end

    return all_recipes_info << recipes
  end

  def self.get_recipe(r)

    return r if r.nil?

    url = "#{BASE_URL}?r=#{r}&app_id=#{APPLICATION_ID}&app_key=#{APPLICATION_KEYS}"
    # send a message through slasck or get has to encode
    data = HTTParty.get(URI.encode(url))

    uri = data[0]["uri"]
    name = data[0]["label"]
    ingredients = data[0]["ingredientLines"]
    image_url = data[0]["image"]
    allergy = data[0]["healthLabels"]
    nutrition = data[0]["dietLabels"]
    link = data[0]["url"]

    return Recipe.new(uri, name, ingredients, image_url, link, allergy, nutrition)
  end
# From and to to get paging done
end

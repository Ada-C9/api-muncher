require 'httparty'
# require_or_load './recipe.rb'
# require 'lib/recipe.rb'
# require 'Recipe'


class EdamamWrapper
  class EdamamError < StandardError; end

  BASE_URL = "https://api.edamam.com/search"

  def self.search_recipes(query)
    id = ENV["APP_ID"]
    key = ENV["APP_KEY"]

    url = BASE_URL + "?q=#{query}" + "&app_id=#{id}" + "&app_key=#{key}" + "&from=0" + "&to=50"
    response = HTTParty.get(url)

    # raise_on_error(response)
    return response["hits"].map do |recipe_hash|
      Recipe.from_api(recipe_hash["recipe"])
    end
  end

  def self.get_recipe(uri)
    id = ENV["APP_ID"]
    key = ENV["APP_KEY"]

    encoded_uri = URI.encode(uri)

    url = BASE_URL + "?r=#{encoded_uri}" + "&app_id=#{id}" + "&app_key=#{key}"

    response = HTTParty.get(url)

    Recipe.from_api(response[0])
  end

  # def self.create_object(array)
  #   return array.map do |recipe_hash|
  #     Recipe.from_api(recipe_hash)
  #   end
  # end

  private
  def self.raise_on_error(response)
    unless response
      raise EdamamError.new("There are no recipes matching your search")
    end
  end
end

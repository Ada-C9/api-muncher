require 'httparty'
require 'pry'
class MuncherApiWrapper


  class MuncherError < StandardError; end
  def self.list_recipes(food)
    token = ENV["MUNCHER_API_KEY"]
    id = ENV["MUNCHER_API_ID"]

    url = "https://api.edamam.com/search?q=#{food}&app_id=#{id}&app_key=#{token} &from=#{0}&to=#{1200}"
    encoded_url = URI.encode(url)

    response = HTTParty.get(encoded_url)

    unless response["more"]
      raise StandardError.new(response["error"])
    end
    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def self.show(uri)
    token = ENV["MUNCHER_API_KEY"]
    id = ENV["MUNCHER_API_ID"]
    uri_root = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
    url = "https://api.edamam.com/search?r=#{uri_root}#{uri}&app_id=#{id}&app_key=#{token}"
    encoded_url = URI.encode(url)

    response = HTTParty.get(encoded_url)
    return Recipe.from_api(response[0])

  end

end

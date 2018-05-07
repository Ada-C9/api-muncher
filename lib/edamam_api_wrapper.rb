require 'httparty'

class EdamamApiWrapper
  class EdamamError < StandardError; end

  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]
  BASE_URL = "https://api.edamam.com/search?"
  BASE_URI = "http://www.edamam.com/ontologies/edamam.owl#recipe_"

  def self.search_results(query)
    url = "#{BASE_URL}q=#{query}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=120"

    response = HTTParty.get(url)

    unless response["count"] > 0
      raise EdamamError.new
    end

    return response["hits"].map do |raw_recipe|
      Recipe.from_query_api(raw_recipe)
    end
  end

  def self.recipe_details(id)
    uri = URI.encode(BASE_URI) + id.to_s
    url = "#{BASE_URL}r=#{uri}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    response = HTTParty.get(url)

    unless response.count > 0
      raise EdamamError.new
    end

    return  Recipe.from_recipe_api(response)
  end
end

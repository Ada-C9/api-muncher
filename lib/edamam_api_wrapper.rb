require 'httparty'

BASE_URL = "https://api.edamam.com/search?"
KEY = ENV["APP_KEY"]
APP = ENV["APP_ID"]

class EdamamApiWrapper
  class EdamamError < StandardError; end

  def self.search(query)
    if query.include?("#recipe_")
      recipe_search(query)
    else
      keyword_search(query)
    end
  end


  def self.recipe_search(query)
    query = query.gsub('#', '%23')
    url = BASE_URL + "r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl#{query}" + "&app_id=#{APP}" + "&app_key=#{KEY}"

    data = HTTParty.get(url)

    if data[0]
      data = data[0]
      return Recipe.from_api(data)
    else
      return []
    end
  end

  def self.keyword_search(query)
    url = BASE_URL + "q=#{query}" "&app_id=#{APP}" + "&app_key=#{KEY}" + "&from=0&to=1000"
    url = URI.encode(url)
    data = HTTParty.get(url)

    if data["hits"]
      return data["hits"].map do |raw_recipe|
        recipe = raw_recipe["recipe"]
        Recipe.from_api(recipe)
      end
    end
  end

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise EdamamError.new(response["error"])
    end
  end

end

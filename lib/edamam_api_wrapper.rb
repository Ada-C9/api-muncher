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
        recipe = Recipe.new(
          label: hit["recipe"]["label"],
          uri: hit["recipe"]["uri"],
          url: hit["recipe"]["url"],
          image: hit["recipe"]["image"],
          source: hit["recipe"]["source"],
          dietLabels: hit["recipe"]["dietLabels"],
          healthLabels: hit["recipe"]["healthLabels"]
        )
        recipes << recipe
      end
    end

    return recipes
  end
end

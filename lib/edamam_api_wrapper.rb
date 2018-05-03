require 'httparty'

class EdamamApiWrapper

  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]
  BASE_URL = "https://api.edamam.com/search?"

  def self.recipe_list(food)
    encoded_uri = URI.encode(BASE_URL + "q=#{food}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&from=0&to=10")

    response = HTTParty.get(encoded_uri).parsed_response

    # unless response["ok"]
    #   raise StandardError.new(response["error!"])
    # end

    details = response["hits"]

  return details.map do |recipe|
      Recipe.from_api(recipe)
    end
  end
end

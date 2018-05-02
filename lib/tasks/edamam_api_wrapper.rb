require 'httparty'

class EdamamApiWrapper

  class EdamamError < StandardError; end

  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]
  BASE_URL = "https://api.edamam.com/search?"

  def self.recipe_list(food)
    encoded_uri = URI.encode(BASE_URL + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "q=" + food)
    response = HTTParty.get(encoded_uri).parsed_response
    raise_on_error(response)

    details = response["hits"]
    return details.map do |raw_recipe|
      Recipe.from_api(raw_recipe['recipe'])
    end
  end

private
  def self.raise_on_error(response)
    unless response["ok"]
      raise SlackError.new(response["error"])
    end
  end
end

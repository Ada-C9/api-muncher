require 'httparty'
require 'pry'


class RecipeApiWrapper
  class RecipeError < StandardError; end

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["API_APP_ID"]
  APP_KEY = ENV["API_APP_KEY"]

  def self.list_recipes

    full_url = URI.encode(BASE_URL + "?q=chicken&app_id=" + APP_ID + "&app_key=" + APP_KEY)

    response = HTTParty.get(full_url)

    raise_on_error(response)

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  # def self.send_message(channel_name, message)
  #   token = ENV["SLACK_API_TOKEN"]
  #   url_root = "https://slack.com/api/chat.postMessage"
  #   # Construct the full URL from the endpoint and the query params
  #   full_url = URI.encode("#{url_root}?channel=#{channel_name}&text=#{message}&token=#{token}&username=This is not Luxi&icon_emoji=:sheepy:")
  #
  #   response = HTTParty.post(full_url)
  #
  #   raise_on_error(response)
  #
  # end

  private
  def self.raise_on_error(response)
    unless response["more"]
      raise RecipeError.new(response["error"])
    end
  end
end

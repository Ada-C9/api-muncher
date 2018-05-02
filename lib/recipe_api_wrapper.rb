require 'httparty'
require 'pry'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  def self.list_recipes
    api_key = ENV["EDAMAM_API_KEY"]
    api_id = ENV["EDAMAM_API_ID"]

    url = "https://api.edamam.com/search?app_id=#{api_id}&app_key=#{api_key}&q=chicken"

    response = HTTParty.get(url)
    #ALWAYS CHECK YOUR ERROR CODES
    unless response["ok"]
      raise StandardError.new(response["error"])
    end

    return response["hits"][0].map do |raw_recipe|
      Channel.from_api(raw_recipe)
    end
  end

  def self.send_message(channel_name, message)
    api_key = ENV["EDAMAM_API_KEY"]
    api_id = ENV["EDAMAM_API_ID"]

    url_root = "https://slack.com/api/chat/postMessage"
    full_url = URI.encode("#{url_root}?channel=#{channel_name}&text=#{message}&token=#{token}")

    response = HTTParty.post(full_url)

    raise_on_error(response)
  end

  private

  def self.raise_on_error(response)
    unless response["ok"]
      raise ReecipeError.new(response["error"])
    end
  end
end

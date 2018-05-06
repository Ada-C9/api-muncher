require 'httparty'
# require 'pry'

class RecipeApiWrapper
  class RecipeError < StandardError; end

  TOKEN_ID = ENV["wolverine"]
  TOKEN_KEY = ENV["storm"]
  BASE_URL = "https://api.edamam.com/search?q="

  def self.recipes(user_query)

    url = URI.encode("#{BASE_URL}#{user_query}&app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}")

    response = HTTParty.get(url).parsed_response

    # ALWAYS CHECK YOUR ERROR CODES
    raise_on_error(response)

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  # def self.send_message(channel_name, message)
  #   token = ENV["SLACK_API_TOKEN"]
  #   url_root = "https://slack.com/api/chat.postMessage"
  #   # Construct the full URL from the endpoint and the query params
  #   full_url = URI.encode("#{url_root}?channel=#{channel_name}&text=#{message}&token=#{token}")
  #
  #   puts "About to send request to #{full_url}"
  #
  #   response = HTTParty.post(full_url)
  #
  #   raise_on_error(response)
  #
  #   # No return needed
  # end

  private
  def self.raise_on_error(response)
    # this needs to be changed based on the api
    unless response["more"]
      raise RecipeError.new(response["error"])
    end
  end
end

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


  
  # def self.send_message(recipe_name)
  #   token = ENV["MUNCHER_API_KEY"]
  #   id = ENV["MUNCHER_API_ID"]
  #   url_root = "https://api.edamam.com/search"
  #   full_url = URI.encode("#{url_root}?app_id=#{id}&app_key=#{token}&recipe=#{recipe_name}")
  #
  # end

  # private
  # def self.raise_on_error(response)
  #   unless response["ok"]
  #     raise SlackError.new(response["error"])
  #   end
  # end
end

puts MuncherApiWrapper.list_recipes('chicken')

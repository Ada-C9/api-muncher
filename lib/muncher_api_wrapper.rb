require 'httparty'
require 'pry'

class MuncherApiWrapper

  def self.get_recipes(query)
    app_id = ENV['MUNCHER_API_ID']
    app_key = ENV['MUNCHER_API_KEY']

    base_url = "https://api.edamam.com/search"
    full_url = URI.encode(base_url + "?q=#{query}" "&app_id=#{app_id}&app_key=#{app_key}")

    response = HTTParty.get(full_url)

    raise_error(response)

    return response['hits'].map do |raw_recipe|
      Recipe.from_api(raw_recipe)
    end
  end

  private

  def self.raise_error(response)
    unless response.message == 'OK'
      raise StandardError.new('No Results')
    end
  end
end

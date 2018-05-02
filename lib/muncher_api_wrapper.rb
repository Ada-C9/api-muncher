require 'httparty'
require 'pry'

class MuncherApiWrapper

  def self.get_recipe(query)
    app_id = ENV['MUNCHER_API_ID']
    app_key = ENV['MUNCHER_API_KEY']

    base_url = "https://api.edamam.com/search"
    full_url = URI.encode(base_url + "?q=#{query}" "&app_id=#{app_id}&app_key=#{app_key}")

    result = HTTParty.get(full_url)
    binding.pry

    unless result['ok']
      raise StandardError.new('No Results')
    else
      return result['hits']
    end
  end
end

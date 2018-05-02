require 'httparty'
require 'pry'

class MuncherApiWrapper

  def self.get_recipes(query)
    app_id = ENV['MUNCHER_API_ID']
    app_key = ENV['MUNCHER_API_KEY']

    base_url = "https://api.edamam.com/search"
    full_url = URI.encode(base_url + "?q=#{query}" "&app_id=#{app_id}&app_key=#{app_key}")

    result = HTTParty.get(full_url)

    raise_error(result)

  end

  private

  def raise_error(result)
    unless result['ok']
      raise StandardError.new('No Results')
    end
  end
end

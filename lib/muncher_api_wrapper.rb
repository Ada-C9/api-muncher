require 'httparty'
require 'pry'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_APPLICATION_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEY"]

  def self.search_recipes(search_term)
    url = "#{BASE_URL}search?q=#{search_term}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    results = HTTParty.get(url)
    if results["hits"]
      return results["hits"]
    else
      return []
    end
  end

  def self.show_recipe

  end

end

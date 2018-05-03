require 'httparty'

class EdemamApiWrapper
  class EdemamError < StandardError; end
  BASE_URL = "https://api.edamam.com "
  TOKEN = ENV["EDEMAM_TOKEN"]
  API_ID = ENV["EDEMAM_ID"]

  def self.search_recipes(item)
    url = BASE_URL + "/search?q=#{item}&app_id=#{API_ID}&app_key=#{TOKEN}&from=0&to=9"
    response = HTTParty.get(url)
    if data["item"]
      return data["item"]
    else
      return []
    end
  end

end

require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_API_ID"]
  KEY = ENV["EDAMAM_API_KEY"]

  def self.list_recipes(query)
    full_url = URI.encode(BASE_URL + "?q=" + query + "&app_id=" + ID + "&app_key=" + KEY + "&from=0&to=50")

    response = HTTParty.get(full_url).parsed_response

  end

end

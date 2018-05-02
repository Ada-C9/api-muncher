require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_API_ID"]
  KEY = ENV["EDAMAM_API_KEY"]

  def self.list_recipes
    full_url = URI.encode("BASE_URL" + "?q=" + query + ) "BASE_URL"+ "?q=" query + "&app_id=" + ID + "&app_key=" + KEY)

    response = HTTParty.get(full_url).parsed_response

  end

end

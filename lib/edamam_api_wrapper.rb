require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_API_ID"]
  KEY = ENV["EDAMAM_API_KEY"]
end

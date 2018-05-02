require "HTTParty"

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]

  class ApiError < StandardError
  end
end

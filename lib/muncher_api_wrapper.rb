require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["MUNCHER_APP_ID"]
  APP_KEY = ENV["MUNCHER_APP_KEY"]
end

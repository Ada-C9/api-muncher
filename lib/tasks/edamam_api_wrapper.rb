require 'httparty'

class EdamamApiWrapper
  app_key = ENV["API_KEY"]
  app_id = ENV["APP_ID"]
  url = ""
  response = HTTParty.get(url)

  unless response["ok"]
    raise StandardError.new(response["error!"])
  end
end

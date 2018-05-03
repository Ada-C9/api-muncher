require 'httparty'
require 'pry'

class EdamamApiWrapper
  TOKEN_APP_ID = ENV['APP_ID']
  TOKEN_APP_KEY= ENV['APP_KEY']
  BASE_URL = "https://api.edamam.com/search"

  def self.list_all_recipes(search)
    url =  (BASE_URL+"?q="+search+"&app_id="+TOKEN_APP_ID+"&app_key="+TOKEN_APP_KEY)
    response = HTTParty.get(url)
  

    return response['hits']
  end


end

require 'httparty'
require 'pry'

class EdamamApiWrapper

  def self.list_recipes()
    BASE_URL = "https://api.edamam.com/search?"
    EDAMAM_ID = ENV["EDAMAM_ID"]
    EDAMAM_KEY = ENV["EDAMAM_KEY"]

  end #self.list_recipes

end #of class

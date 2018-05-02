require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipies(user_input)
    response = HTTParty.get("#{URL}search?q=#{user_input}&app_id=#{ID}&app_key=#{KEY}")

  end

  def self.show_recipie

  end

end

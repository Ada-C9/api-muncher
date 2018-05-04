class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  TOKEN = ENV["EDAMAM_TOKEN"]
  ID = ENV["EDAMAM_ID"]

  def self.find_it(terms)

    message_url = BASE_URL + "q=#{terms}&" + "app_id=#{ID}&" + "app_key=#{TOKEN}"

    response = HTTParty.get(message_url)

    return response
  end

end

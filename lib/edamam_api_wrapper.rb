

class EdamamApiWrapper

  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]
  BASE_URL = "https://api.edamam.com/search?"

  def self.recipe_list(food)
    encoded_uri = URI.encode(BASE_URL + "q=#{food}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&from=0&to=12")

    response = HTTParty.get(encoded_uri)


    unless response["more"]
      raise StandardError.new(response["error!"])
    end

    return response["hits"].each do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end
end

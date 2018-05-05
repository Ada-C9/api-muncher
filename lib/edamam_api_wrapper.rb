class EdamamApiWrapper

  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]
  BASE_URL = "https://api.edamam.com/search?"

  def self.recipe_list(food)
    encoded_uri = URI.encode(BASE_URL + "q=#{food}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&from=0&to=12")

    response = HTTParty.get(encoded_uri).parsed_response
    unless response["more"]
      raise StandardError.new(response["error!"])
    end

    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end
  end

  def self.recipe_detail(uri)
    encoded_uri = URI.encode(BASE_URL + "r=#{uri}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}")
    response = HTTParty.get(encoded_uri)

    return response.map do |raw_recipe|
      Recipe.from_api(raw_recipe)
    end
  end

end

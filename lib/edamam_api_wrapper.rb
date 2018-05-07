require 'httparty'

class EdamamApiWrapper
  class EdamamError < StandardError; end

  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV['EDAMAM_ID']
  APP_KEY = ENV['EDAMAM_KEY']

  def self.one_recipe(uri)
    # this is linked to show page
    url = "#{BASE_URL}r=http://www.edamam.com/ontologies/edamam.owl#recipe_#{uri}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    if response[0].nil?
      return nil
    else
    return Recipe.from_api(response[0])
  end

  def self.all_recipes(user_input)
    url = "#{BASE_URL}q=#{user_input}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=999"

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    unless response["more"]
      raise
      StandardError.new(response["error"])
    end
    return response["hits"].map do |raw_recipe|
      Recipe.from_api(raw_recipe["recipe"])
    end


  end

end

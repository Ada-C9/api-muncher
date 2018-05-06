require 'httparty'
require 'will_paginate'

class EdamamApiWrapper

  TOKEN_APP_ID = ENV['APP_ID']
  TOKEN_APP_KEY= ENV['APP_KEY']
  BASE_URL = "https://api.edamam.com/search"

  def self.list_all_recipes(search)
    url =  (BASE_URL+"?q="+search+"&app_id="+TOKEN_APP_ID+"&app_key="+TOKEN_APP_KEY+"&from=0&to=84")
    response = HTTParty.get(url)

    raise_on_error(response)

    return response['hits'].map do |raw_data|
      Recipe.from_api(raw_data["recipe"])
    end
  end

  def self.get_recipe(uri)

    url =  (BASE_URL+"?r=http:%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{uri}&app_id="+TOKEN_APP_ID+"&app_key="+TOKEN_APP_KEY)

    response = HTTParty.get(url)

    raise_on_error(response)

    Recipe.from_api(response[0])
  end

  private
  def self.raise_on_error(response)
    unless response.code == 200
      raise StandardError
    end
  end

end

require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://test-es.edamam.com/search"

  def self.list_recipes(search_term)
    url = BASE_URL + "?q=#{ search_term }"
    data = HTTParty.get(url)
    return data
  end

end # EdamamApiWrapper

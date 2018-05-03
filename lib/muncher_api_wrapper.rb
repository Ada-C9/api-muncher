# is this necessary? I installed the gem...
require 'httparty'

class ApiMuncherWrapper
  BASE_URL = "https://test-es.edamam.com/search"
  APPLICATION_ID = ENV["APPLICATION_ID"]
  APPLICATION_KEYS = ENV["APPLICATION_KEYS"]

  # This sends a get request with my search word etc to the API and gets a JSON that will be used to create new recipe instances
  def self.list_recipes
    url = BASE_URL + "q=" + word + APPLICATION_ID + APPLICATION_KEYS
    data = HTTParty.get(url)
  end


end

# can I make another class here called recipe
# has the attributes for recipe outlined in the trello board

# nope make a new lib file of the recipe object :)

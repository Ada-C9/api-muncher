require 'httparty'
require 'pry'

class EdamamApiWrapper
  BASE_URL = "https://test-es.edamam.com/search"
  SINGLE_RECIPE_URL = "http://www.edamam.com/ontologies/edamam.owl#recipe_"

  def self.list_recipes(search_term)
    url = BASE_URL + "?q=#{ search_term }"
    data = HTTParty.get(url)
    recipe_list = []
    if data['hits']
      data['hits'].each do |hit|
        recipe_data = hit['recipe']
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end

  def self.show_recipe(recipe_uri_id)
    uri_id = get_uri_id(recipe_uri_id)
    url = SINGLE_RECIPE_URL +  uri_id 
    formatted_url = format_url(url)
    data = HTTParty.get(formatted_url)
    raise
    recipe = create_recipe(data.first)
    return recipe
  end

  private
  def self.create_recipe(api_params)
    # binding.pry
    return Recipe.new(
      api_params['label'],
      api_params['image'],
      api_params['ingredientLines'],
      api_params['dietLabels'],
      api_params['url'],
      get_uri_id(api_params['uri'])
    )
  end # create_recipe

  def self.get_uri_id(uri)
    id = uri
    if uri.include?("recipe_")
      split_uri = uri.split("recipe_")
      id = split_uri.last
    end
    return id
  end # get_uri_id

  def self.format_url(url)
    while url.include?(":") do
      i = url.index(":")
      url[i] = "%3A"
    end
    while url.include?("/") do
      i = url.index("/")
      url[i] = "%2F"
    end
    while url.include?("#") do
      i = url.index("#")
      url[i] = "%23"
    end
    return url
  end # url

end # EdamamApiWrapper

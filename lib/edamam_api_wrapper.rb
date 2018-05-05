require 'httparty'

class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  @recipe_list = []

  def self.list_recipes(search)
    # def self.search_for(query)
    if !@recipe_list.empty?
      @recipe_list = []
    end

    encoded_uri =  URI.encode("#{URL}?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=30")

    response = HTTParty.get(encoded_uri)

    if response ["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe["recipe"])
      end
    end

    return @recipe_list

  end

  def self.show_recipe(uri)
    recipe_uri_list = []

    @recipe_list.each do |recipe|
      recipe_uri_list << recipe.uri
    end

    if !recipe_uri_list.include?(uri)
      encoded_uri = URI.encode("#{URL}?r=http://www.edamam.com/ontologies/edamam.owl#recipe_#{uri}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

      response = HTTParty.get(encoded_uri)

      return Recipe.new(response[0])
    end

    @recipe_list.each do |recipe|
      if recipe.uri == uri
        return recipe
      end
    end
  end
end

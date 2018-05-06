require 'httparty'

class EdamamApiWrapper
  URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  @recipe_list = []

  def self.list_recipes(search)
    if !@recipe_list.empty?
      @recipe_list = []
    end

    response = HTTParty.get("#{URL}?q=#{search}&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=100")


    if response["hits"]
      response["hits"].each do |recipe|
        @recipe_list << Recipe.new(recipe["recipe"])
      end
    end
    return @recipe_list
  end

  def self.find_recipe(id)
    @recipe_list.find {|recipe| recipe.id == id }
  end
end

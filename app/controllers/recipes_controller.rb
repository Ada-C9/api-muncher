class RecipesController < ApplicationController
  URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEYS"]

  def root
  end

  def index
    @query = params[:search]
    @recipes = EdamamApiWrapper.get_recipes(@query)

    # encoded_uri = URI.encode("#{URL}search?q=#{@queary}&app_id=#{ID}&app_key=#{KEY}")
    #
    # response = HTTParty.get(encoded_uri)
    #
    # @recipes = []
    #
    # if response["hits"]
    #   response["hits"].each do |entry|
    #     @recipes << entry
    #   end
    # end
  end
end

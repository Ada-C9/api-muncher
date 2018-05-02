require 'pry'

class EdamamWrapper
  class EdamamError < StandardError; end

  def self.search_recipes
    id = ENV["APP_ID"]
    key = ENV["APP_KEY"]
    search_term = @search_term

    url = "https://api.edamam.com/search?q=#{search_term}&app_id=#{id}_key=#{key}"
    response = HTTParty.get(url)

    raise_on_error(response)

    return response["hits"].map do |recipe_hash|
      Recipe.from_api(recipe_hash)
    end
  end

  private
  def self.raise_on_error(response)
    unless response
      raise EdamamError.new("There are no recipes")

    end
  end

end

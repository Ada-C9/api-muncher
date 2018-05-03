class MuncherApiWrapper
  include HTTParty

  APP_ID = ENV['MUNCHER_API_ID']
  APP_KEY = ENV['MUNCHER_API_KEY']
  base_uri "https://api.edamam.com/search"

  def self.get_recipes(query, page_no)
    last = (page_no.to_i * 12) + 1
    first = ((page_no.to_i * 12) - 11)

    full_url = URI.encode(base_uri + "?q=#{query}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=#{first}&to=#{last}")

    response = HTTParty.get(full_url)

    raise_error(response)

    return response['hits'].map do |raw_recipe|
      Recipe.from_api(raw_recipe['recipe'])
    end
  end

  def self.get_one_recipe(recipe_uri)
    if recipe_uri.nil? || recipe_uri.empty?
      raise ArgumentError.new('Needs a valid URI')
    end

    full_url = URI.encode(base_uri + "?r=#{recipe_uri}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    response = HTTParty.get(full_url)

    raise_error(response)

    return Recipe.from_api(response[0])
  end

  private

  def self.raise_error(response)
    unless response.message == 'OK'
      raise StandardError.new('No Results')
    end
  end
end

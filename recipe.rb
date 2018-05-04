require 'httparty'
require "pry"
require "awesome_print"

module Recipe
  def self.list_recipes(flavor)
    app_id = "4953da69"
    app_key = "a68a91fde2f004b9891bc48865aa0b80"

    url_root = "https://api.edamam.com/search"
    full_url = URI.encode("#{url_root}?q=#{flavor}&app_id=#{app_id}&app_key=#{app_key}")

    response = HTTParty.get(full_url).parsed_response

    return response
  end
end

flavor = "banana"

result = Recipe.list_recipes(flavor)
ap result
binding.pry

result["hits"].each do |h|
  ap h["recipe"]["label"]
end

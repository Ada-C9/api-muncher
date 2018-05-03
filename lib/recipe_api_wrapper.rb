require 'httparty'
require 'pry'

class RecipeApiWrapper
	BASE_URL = "https://api.edamam.com/search?q="
	ID = ENV["EDAMAM_ID"]
	KEY = ENV["EDAMAM_KEY"]


	def self.search_recipes(query)
		encoded_uri = URI.encode(BASE_URL + query + "&app_id=#{ID}" + "&app_key=#{KEY}")

		response = HTTParty.get(encoded_uri).parsed_response

		# just return the recipes for that search and other function will list
		hits = response["hits"]

		hits.each do |hit|
			return hit["recipe"]["image"]
		end
	end

	def self.list_recipes
		search = chicken
		# responses already in JSON...
		url = BASE_URL + "#{search}" + "&app_id=#{ID}" + "&app_key=#{KEY}"

		response = HTTParty.get(url)

		raise_on_error(response)

		return response.map do |raw_hit|
			Recipe.from_api(raw_hit)
		end

	end

	private
	def self.raise_on_error(response)
		unless response["OK"]
			raise EdamamError.new(response["error"])
		end
	end
end

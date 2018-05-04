require 'httparty'
require 'pry'

class RecipeApiWrapper
	class EdamamError < StandardError; end
	BASE_URL = "https://api.edamam.com/search?q="
	ID = ENV["EDAMAM_ID"]
	KEY = ENV["EDAMAM_KEY"]

	def self.list_recipes(query)
		encoded_uri = URI.encode(BASE_URL + query + "&app_id=#{ID}" + "&app_key=#{KEY}")
		#
		response = HTTParty.get(encoded_uri).parsed_response

		hits = response["hits"]

		# raise_on_error(response)

		return hits.map do |raw_hit|
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

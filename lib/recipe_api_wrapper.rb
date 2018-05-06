require 'httparty'
require 'pry'

class RecipeApiWrapper
	class EdamamError < StandardError; end
	BASE_URL = "https://api.edamam.com/"
	ID = ENV["EDAMAM_ID"]
	KEY = ENV["EDAMAM_KEY"]

	def self.list_recipes(query)
		encoded_uri = URI.encode(BASE_URL + "search?q=" + query + "&app_id=#{ID}" + "&app_key=#{KEY}")

		response = HTTParty.get(encoded_uri).parsed_response

		recipe_response = response["hits"]

		# raise_on_error(response)
		return recipe_response.map do |raw_recipe|
			Recipe.new(raw_recipe)
		end
	end

	def self.get_details(uri)

		# https://api.edamam.com
		base = "https://api.edamam.com/ontologies/edamam.owl#"

		# base = URI.encode("http://www.edamam.com/ontologies/edamam.owl#")

		url = base + uri + "&app_id=#{ID}" + "&app_key=#{KEY}"

		response = HTTParty.get(url).parsed_response

		hits = response["hits"]

		# raise

		# return hits.map do |raw_hit|
		# from_api(raw_hit)
		# end

		return Recipe.new(hits)
	end

	private
	def self.raise_on_error(response)
		unless response["OK"]
			raise EdamamError.new(response["error"])
		end
	end
end

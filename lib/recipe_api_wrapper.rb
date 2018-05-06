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
		# return hits.map do |raw_hit|
			# from_api(raw_hit)
		# end

		# Recipe.new(hits)
	end

	def self.get_details(recipe_uri)
		base = URI.encode("http://www.edamam.com/ontologies/edamam.owl#recipe_")

		url = base + recipe_uri + "&app_id=#{ID}" + "&app_key=#{KEY}"

		response = HTTParty.get(url).parsed_response

		return Recipe.new(response)
	end

	private
	def self.raise_on_error(response)
		unless response["OK"]
			raise EdamamError.new(response["error"])
		end
	end
end

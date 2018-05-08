require 'httparty'

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
			# if raw_recipe
			# 	Recipe.paginate(page: page, per_page: 10).order('id DESC')
			# end
		end
	end

	def self.get_details(uri)

		# https://api.edamam.com
		base = "https://api.edamam.com/ontologies/edamam.owl#"

		parsed_uri = uri.split("recipe_")
		# base = URI.encode("http://www.edamam.com/ontologies/edamam.owl#")

		url = base + parsed_uri + "&app_id=#{ID}" + "&app_key=#{KEY}"

		response = HTTParty.get(url).parsed_response

		hits = response["hits"]

		return Recipe.new(hits)
	end

	private
	def self.raise_on_error(response)
		unless response["OK"]
			raise EdamamError.new(response["error"])
		end
	end
end

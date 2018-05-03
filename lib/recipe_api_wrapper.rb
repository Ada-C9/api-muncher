# calling methods directly on the class
# search recipe that makes calls to API
# list recipes

require 'httparty'
require 'pry'

class RecipeApiWrapper
	#https://api.edamam.com/search?q=chicken&app_id=ca7c58a1&app_key=dc5c0e810b7633854a733ca451bf7c3b

	#"https://api.edamam.com/search?q=chicken&app_id=ca7c58a1&app_key=7398d40ea0ffc5ea473d08119b01bba5"
	BASE_URL = "https://api.edamam.com/search?q="
	ID = ENV["EDAMAM_ID"]
	KEY = ENV["EDAMAM_KEY"]


	def self.search_recipes(query)
		encoded_uri = URI.encode(BASE_URL + query + "&app_id=#{ID}" + "&app_key=#{KEY}")
		puts encoded_uri

		response = HTTParty.get(encoded_uri).parsed_response

		hits = response["hits"]
		puts "THESE ARE THE RECIPES: #{hits}"

		hits.each do |hit|
			puts hit["recipe"]
		end
	end

	def self.list_recipes
		search = chicken
		# responses already in JSON...
		url = BASE_URL + "#{search}" + "&app_id=#{ID}" + "&app_key=#{KEY}"

		response = HTTParty.get(url)

		# raise_on_error(response)

		# if response
		#   return response["hits"]
		# else
		#   return []
		# end

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

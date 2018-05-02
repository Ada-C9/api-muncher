# calling methods directly on the class
# search recipe that makes calls to API
# list recipes

require 'httparty'
require 'pry'

class RecipeApiWrapper
	BASE_URL = "https://api.edamam.com/"
	ID = ENV["EDAMAM_ID"]
	TOKEN = ENV["EDAMAM_TOKEN"]

	def self.list_recipes
		# responses already in JSON...
		url = BASE_URL +
		"search?q=chicken" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"

		response = HTTParty.get(url)

		# raise_on_error(response)

		# if response
		#   return response["hits"]
		# else
		#   return []
		# end

	# return response["channels"].map do |raw_channel|
		# creating instances of channels
		# requires Recipe class
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

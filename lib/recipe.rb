class Recipe
	attr_reader :name, :photo_url, :ingredients, :dietary_labels, :url, :uri

	def initialize(name, photo_url, ingredients, dietary_labels, url, uri)
		# if recipe_response.nil? || recipe_response.empty?
		# 	raise ArgumentError.new("Oops, this is embarrasing. We can't find the data you're looking for.")
		# end

		# @uri = recipe_response["recipe"]["uri"]
		# @label = recipe_response["recipe"]["label"]
		# @image = recipe_response["recipe"]["image"]
		# @url = recipe_response["recipe"]["url"]
		# @ingredients = recipe_response["recipe"]["healthlabels"]

		@name = name
		@photo_url = photo_url
		@ingredients = ingredients
		@dietary_labels = dietary_labels
		@url = url
		@uri = uri
	end
end

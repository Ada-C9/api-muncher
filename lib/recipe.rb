class Recipe

	# this is a factory method. Keeps code dry and isolates dependencies
	attr_reader :image, :label, :url, :uri, :ingredients, :healthlabels

	def initialize(recipe_response)
		if recipe_response.nil? || recipe_response.empty?
			raise ArgumentError.new("Oops, this is embarrasing. We can't find the data you're looking for.")
		end

		@uri = recipe_response["recipe"]["uri"]
		@label = recipe_response["recipe"]["label"]
		@image = recipe_response["recipe"]["image"]
		@url = recipe_response["recipe"]["url"]
		@ingredients = recipe_response["recipe"]["healthlabels"]

		# def self.from_api(raw_hit)
		# 	self.new(
		# 		raw_hit["recipe"]["uri"],
		# 		raw_hit["recipe"]["label"],
		# 		raw_hit["recipe"]["image"],
		# 		raw_hit["recipe"]["url"],
		# 		raw_hit["recipe"]["healthlabels"]
		# 	)
		# end
	end
end

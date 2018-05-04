class Recipe

	# this is a factory method. Keeps code dry and isolates dependencies
	attr_reader :image

	def initialize(image)
		@image = image
	end

	# if not nil, should return list of recipes
	def self.from_api(raw_hit)
		self.new(
			raw_hit["recipe"]["image"]
		)
	end
end

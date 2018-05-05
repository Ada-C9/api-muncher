class Recipe

	# this is a factory method. Keeps code dry and isolates dependencies
	attr_reader :image, :label

	def initialize(image, label)
		@image = image
		@label = label
	end

	# if not nil, should return list of recipes
	def self.from_api(raw_hit)
		self.new(
			raw_hit["recipe"]["image"],
			raw_hit["recipe"]["label"]
		)
	end
end

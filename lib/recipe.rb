class Recipe

	# this is a factory method. Keeps code dry and isolates dependencies
	attr_reader :recipe

	def initialize(recipe)
		@recipe = recipe
	end

	# if not nil, should return list of recipes
	def self.from_api(raw_hits)
		self.new(raw_hits["recipe"])
	end
end

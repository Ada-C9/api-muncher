class Recipe

	# this is a factory method. Keeps code dry and isolates dependencies
	attr_reader :name

	def initialize(name)
		@name = name
	end

	# if not nil, should return list of recipes
	def self.from_api(raw_recipe)
		self.new(raw_recipe["name"])
	end
end

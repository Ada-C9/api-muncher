class Recipe
	include Standards

	attr_reader :name, :uri, :url, :image, :ingredients, :diet_labels,
		:health_labels

	def initialize(params)
		@name = params['label'] # String
		@uri = params['uri'] # String, looks like url but functions as id in search. See docs.
		@url = params['url'] # String, url
		@image = params['image'] # String, url
		@ingredients = params['ingredientLines'] # array of Strings
		@diet_labels = params['dietLabels'] # array of String
		@health_labels = params['healthLabels'] # array of Strings
	#	TODO: valid checks for everything!
	end

end

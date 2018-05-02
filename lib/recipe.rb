class Recipe
	attr_reader :name, :uri, :url, :image, :ingredients, :diet_labels,
		:health_labels

	def initialize(name, uri, url, image, ingredients, diet_labels, health_labels,
				options = {})
		@name = name # called 'label' from API
		@uri = uri # String, looks like url but functions as id in search. See docs.
		@url = url # String, url
		@image = image # String, url
		@ingredients = ingredients # array, called 'ingredientLines' in API
		@diet_labels = diet_labels # array, called 'dietLabels' in API
		@health_labels = health_labels # array, called 'healthLabels' in API
	end

end

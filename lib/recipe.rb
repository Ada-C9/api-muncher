class Recipe
	attr_reader :name, :photo_url, :ingredients, :dietary_labels, :url, :uri

	def initialize(name, photo_url, ingredients, dietary_labels, url, uri)
		@name = name
		@photo_url = photo_url
		@ingredients = ingredients
		@dietary_labels = dietary_labels
		@url = url
		@uri = uri
	end
end

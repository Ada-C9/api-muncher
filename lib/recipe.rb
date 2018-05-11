class Recipe
	include Standards

	attr_reader :name, :uri, :url, :image, :ingredients, :diet_labels,
		:health_labels

	def initialize(params)
		@name = params['label'] # String
		@uri = params['uri'] # String, looks like url but functions as id in search
		@url = params['url'] # String, url
		@image = params['image'] # String, url
		@ingredients = params['ingredientLines'] # array of Strings
		@diet_labels = params['dietLabels'] # array of String
		@health_labels = params['healthLabels'] # array of Strings
		valid_or_error
	end

	private

	def valid_or_error
		raise ArgumentError.new("Invalid name") if !is_nonempty_string?(@name)
		raise ArgumentError.new("Invalid uri") if !is_nonempty_string?(@uri)
		raise ArgumentError.new("Invalid url") if !is_nonempty_string?(@url)
		raise ArgumentError.new("Invalid image") if !is_nonempty_string?(@image)
		raise ArgumentError.new("Invalid ingredients") if !@ingredients.is_a?(Array)

		if !valid_label?(@diet_labels, DIET_OPTIONS)
			raise ArgumentError.new("Invalid diet label")
		end

		if !valid_label?(@health_labels, HEALTH_OPTIONS)
			raise ArgumentError.new("Invalid health label")
		end
	end

	def is_nonempty_string?(input)
		return input.is_a?(String) && !input.blank?
	end

	def valid_label?(curr_list, allowable)
		return curr_list.is_a?(Array) && curr_list.all? { |label|
			allowable.include?(label) }
	end

end

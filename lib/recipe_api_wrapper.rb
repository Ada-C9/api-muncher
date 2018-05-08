require 'httparty'

class RecipeApiWrapper
	class EdamamError < StandardError; end
	BASE_URL = "https://api.edamam.com/search"
	SINGLE_RECIPE_URL = "https://api.edamam.com/ontologies/edamam.owl#recipe_"
	ID = ENV["EDAMAM_ID"]
	KEY = ENV["EDAMAM_KEY"]

	def self.list_recipes(query)
		if query
			url = BASE_URL + "?q=#{ query }" + "&app_id=#{ID}" + "&app_key=#{KEY}"


			response = HTTParty.get(url).parsed_response

			recipe_responses = response["hits"]

			# raise_on_error(response)
			recipes = []
				return recipe_responses.each do |raw_recipe|
					recipes << initialize_recipe(raw_recipe["recipe"])
				end
			return recipes
		end
		raise
	end

	def self.get_details(uri)
		url = URI.encode(BASE_URL + "?r=" + uri + "&app_id=#{ID}" + "&app_key=#{KEY}")


		response = HTTParty.get(url)
		recipe = initialize_recipe(response.first)
		return recipe
	end

	private
	def self.raise_on_error(response)
		unless response["OK"]
			raise EdamamError.new(response["error"])
		end
	end

	def self.initialize_recipe(api_params)
		raise StandardError.new("Bad recipe data. Could not create recipe.") if api_params.nil?

		return Recipe.new(
			api_params['label'],
			api_params['image'],
			api_params['ingredientLines'],
			api_params['dietLabels'],
			api_params['url'],
			api_params['uri']
		)
	end

	# def self.split_uri(uri)
	# 	id = uri
	# 	if uri.include?("recipe_")
	# 		split_uri = uri.split("recipe_")
	# 		id = split_uri.last
	# 	end
	# 	return id
	# end
end

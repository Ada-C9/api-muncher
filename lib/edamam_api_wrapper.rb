require 'httparty'
require 'will_paginate/array'

class EdamamApiWrapper
	include Standards

	URL = "https://api.edamam.com/search?"
	APP_ID = ENV["APPLICATION_ID"]
	APP_KEY = ENV["APPLICATION_KEY"]

	def self.search_recipes(query_text, from: 0, to: 40, diet: nil, health: nil)
		search_url = build_url_for_search(query_text, from, to, diet, health)
		response = HTTParty.get(search_url)

		recipes_list = []
		if response["hits"]
			response["hits"].each { |hit| recipes_list << Recipe.new(hit['recipe']) }
		end
		return recipes_list
	end


	def self.get_recipe(recipe_uri)
	end

	# def self.send_message(channel, message)
	# 	message_url = "#{URL}chat.postMessage"
	# 	response = HTTParty.post(message_url,
	# 		body: {
	# 			"token" => TOKEN,
	# 			"channel" => channel,
	# 			"text" => message,
	# 			"username" => "FrontRowNewsBot",
	# 			"icon_emoji" => ":nerd_face:",
	# 			"as_user" => "false"
	# 		},
	# 		:header => { 'Content-Type' => 'application/x-www-form-urlencoded' }
	# 	)
	# 	# return response.success? # initial way we did this.
	# 	return response # changed after testing. Can keep the original way if you want
	# end

	private

	# QUESTION: Do to and from have to come together? Are there any rules about
	# their relationship with each other.

	def self.build_url_for_search(query_text, from, to, diet, health)
		build_url = "#{URL}q=#{query_text}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
		add_from_to_url(from, build_url)
		add_to_to_url(to, build_url)
		add_diet_to_url(diet, build_url)
		add_health_to_url(health, build_url)
		return build_url
	end

	def self.add_diet_to_url(diet, build_url)
		build_url << "&diet=#{diet}" if DIET_OPTIONS.include?(diet)
	end

	def self.add_health_to_url(health, build_url)
		build_url << "&health=#{health}" if HEALTH_OPTIONS.include?(health)
	end
	#
	# def self.add_to_or_from_to_url(from, build_url)
	# 	if !from.nil? && !(from.is_a?(Integer) && from >= 0)
	# 		raise ArgumentError.new("invalid 'from'")
	# 	end
	# 	build_url << "&from=" << from if from.is_a?(Integer)
	# end

	def self.add_from_to_url(from, build_url)
		if !from.nil? && !(from.is_a?(Integer) && from >= 0)
			raise ArgumentError.new("invalid 'from'")
		end
		build_url << "&from=#{from}" if from.is_a?(Integer)
	end

	def self.add_to_to_url(to, build_url)
		if !to.nil? && !(to.is_a?(Integer) && to >= 0)
			raise ArgumentError.new("invalid 'to'")
		end
		build_url << "&to=#{to}" if to.is_a?(Integer)
	end

end

################################################################################

# EXAMPLE:
# https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}
# &app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free

# "more" : true,
# "count" : 14936,
# "hits" : [ { 			# start of hits
# 	"recipe" : { 										# start of first recipe
# 	 	"uri" : "http://www.edamam.com/ontologies/edamam.owl#recipe_3da...dee89f",
# 	 	"label" : "Grilled Butterflied Chicken Recipe",
# 	 	"image" : "https://www.edamam.com/web-img/7a2/7a2f41a78...30c6463.jpg",
# 	 	"source" : "Serious Eats",
# 	 	"url" : "http://www.seriouseats.com/recipes/2012/08/grilled...ipe.html",
# 	 	"shareAs" : "http://www.edamam.com/recipe/grilled...722-cal",
# 	 	"yield" : 4.0,
# 	 	"dietLabels" : [ "Low-Carb" ],
# 	 	"healthLabels" : [ "Sugar-Conscious", "Peanut-Free",..., "Alcohol-Free" ],
# 	 	"cautions" : [ ],
# 	 	"ingredientLines" : [ "1 whole chicken, 3 1/2 to 4 pounds",
#                          "Kosher salt and freshly ground black pepper" ],
# 		... more stuff
# 	}, 																# end of first recipe
#  	"recipe" : {											# start of next recipe
# 	 	...
# 	}																	# end of next recipe
# ]										# end of hits

# FROM API DOCS
# +-----------+----------+---------+-------------------------------------------+
# | Parameter | Required | Type    | Description
# +-----------+----------+---------+-------------------------------------------+
#   q         | yes*     | string  | Query text. For example q=chicken. This or
# 						|					 |				 | the r parameter are required
# +-----------+----------+---------+-------------------------------------------+
#   r         | yes*     | string  | Returns information about a specific recipe
# 						|					 |				 | based on its ID ie. -r=http%3A%2F%2Fwww.
# 						|				   |				 | edamam.com%2Fontologies%2Fedamam.owl%23r
# 						|					 |			   | ecipe_9b5945e03f05acbf9d69625138385408
# 						|					 |				 | This or the q parameter are required
# +-----------+----------+---------+-------------------------------------------+
#   app_id    | yes      | string  | Your 3scale application ID
# +-----------+----------+---------+-------------------------------------------+
#   app_key   | yes      | string  | Your 3scale application key
# +-----------+----------+---------+-------------------------------------------+
#   from      | no       | integer | First result index (default 0).
#							|					 |				 | Example: from=20
# +-----------+----------+---------+-------------------------------------------+
#   to        | no       | integer | Last result index (exclusive, default
# 						|					 |				 | from + 10). Example: to=30
# +-----------+----------+---------+-------------------------------------------+
#   ingr      | no       | integer | Maximum number of ingredients.
#							|					 |				 | Example: ingr=5
# +-----------+----------+---------+-------------------------------------------+
#   diet      | no       | enum    | Diet label: one of “balanced”,
#							|					 |				 |	 “high-protein”, “high-fiber”, “low-fat”,
#							|					 |				 | “low-carb”, “low-sodium”
# +-----------+----------+---------+-------------------------------------------+
#   health    | no       | enum    | Health label: One of the Health api params
# 						|					 |			   | listed in Diet and Health Labels table
# 						|					 |				 | in documentation. For example:
# 						|					 |				 | “peanut-free”, “tree-nut-free”, “soy-free”,
# 						|					 |				 | “fish-free”, “shellfish-free”
# +-----------+----------+---------+-------------------------------------------+
#   callback  | no       | string  | Callback parameter for JSONP. This will
# 						|					 |			   | “envelop” result in a JavaScript function
# 						|					 |			   | call to the specified callback. Optional
# +-----------+----------+---------+-------------------------------------------+
# *Exactly one of these ( q / r ) must be present

#   Hits
# +--------+------------+------------------------------------------------------+
# | Field  | Type       | Description
# +--------+------------+------------------------------------------------------+
# | q      | string     | Query text, as submitted
# +--------+------------+------------------------------------------------------+
# | from   | integer    | First result index, as submitted
# +--------+------------+------------------------------------------------------+
# | to     | integer    | Last result index, as submitted
# +--------+------------+------------------------------------------------------+
# | params | String[][] | Effective parameters
# +--------+------------+------------------------------------------------------+
# | count  | integer    | Number of results found
# +--------+------------+------------------------------------------------------+
# | more   | boolean    | More that the maximum allowed number of results found
# +--------+------------+------------------------------------------------------+
# | hits   | Hit[]      | Matching results (Hit objects)
# +--------+------------+------------------------------------------------------+

# Hit
# +--------+------------+------------------------------------------------------+
# | Field      | Type    | Description
# +--------+------------+------------------------------------------------------+
# | recipe     | Recipe  | Matching recipe (Recipe object)
# +--------+------------+------------------------------------------------------+
# | bookmarked | boolean | Is this recipe bookmarked by the searching user?
# +--------+------------+------------------------------------------------------+
# | bought     | boolean | Is this recipe bought by the searching user?
# +--------+------------+------------------------------------------------------+

# Recipe
# +----------------+----------------+------------------------------------------+
# | Field          | Type           | Description
# +----------------+----------------+------------------------------------------+
# | uri            | string         | Ontology identifier
# +----------------+----------------+------------------------------------------+
# | label          | string         | Recipe title
# +----------------+----------------+------------------------------------------+
# | image          | string         | Image URL
# +----------------+----------------+------------------------------------------+
# | source         | string         | Source site identifier
# +----------------+----------------+------------------------------------------+
# | url            | string         | Original recipe URL
# +----------------+----------------+------------------------------------------+
# | yield          | integer        | Number of servings
# +----------------+----------------+------------------------------------------+
# | calories       | float          | Total energy, kcal
# +----------------+----------------+------------------------------------------+
# | totalWeight    | float          | Total weight, g
# +----------------+----------------+------------------------------------------+
# | ingredients    | Ingredient[]   | Ingredients list
# +----------------+----------------+------------------------------------------+
# | totalNutrients | NutrientInfo[] | Total nutrients for the entire recipe
# +----------------+----------------+------------------------------------------+
# | totalDaily     | NutrientInfo[] | % daily value for the entire recipe
# +----------------+----------------+------------------------------------------+
# | dietLabels     | enum[]         | Diet labels: “balanced”, “high-protein”,
# |                |                | “high-fiber”, “low-fat”, “low-carb”,
# |                |                | “low-sodium” (labels are per serving)
# +----------------+----------------+------------------------------------------+
# | healthLabels   | enum[]         | Health labels: “vegan”, “vegetarian”,
# |                |                | “paleo”, “dairy-free”, “gluten-free”,
# |                |                | “wheat-free”, “fat-free”, “low-sugar”,
# |                |                | “egg-free”, “peanut-free”, “tree-nut-free”,
# |                |                | “soy-free”, “fish-free”, “shellfish-free”
# |                |                | (labels are per serving)
# +----------------+----------------+------------------------------------------+

# Diet Labels
# +--------+-----------------+-----------------+
# | Type   | Web Label       | API Parameter   |
# +--------+-----------------+-----------------+
# | Diet   | Balanced        | balanced        |
# +--------+-----------------+-----------------+
# | Diet   | High-Fiber      | high-fiber      |
# +--------+-----------------+-----------------+
# | Diet   | High-Protein    | high-protein    |
# +--------+-----------------+-----------------+
# | Diet   | Low-Carb        | low-carb        |
# +--------+-----------------+-----------------+
# | Diet   | Low-Fat         | low-fat         |
# +--------+-----------------+-----------------+
# | Diet   | Low-Sodium      | low-sodium      |
# +--------+-----------------+-----------------+


# Health Labels
# +--------+-----------------+-----------------+
# | Type   | Web Label       | API Parameter   |
# +--------+-----------------+-----------------+
# | Health | Alcohol-free    | alcohol-free    |
# +--------+-----------------+-----------------+
# | Health | Celery-free     | celery-free     |
# +--------+-----------------+-----------------+
# | Health | Crustacean-free | crustacean-free |
# +--------+-----------------+-----------------+
# | Health | Dairy           | dairy-free      |
# +--------+-----------------+-----------------+
# | Health | Eggs            | egg-free        |
# +--------+-----------------+-----------------+
# | Health | Fish            | fish-free       |
# +--------+-----------------+-----------------+
# | Health | Gluten          | gluten-free     |
# +--------+-----------------+-----------------+
# | Health | Kidney friendly | kidney-friendly |
# +--------+-----------------+-----------------+
# | Health | Kosher          | kosher          |
# +--------+-----------------+-----------------+
# | Health | Low potassium   | low-potassium   |
# +--------+-----------------+-----------------+
# | Health | Lupine-free     | lupine-free     |
# +--------+-----------------+-----------------+
# | Health | Mustard-free    | mustard-free    |
# +--------+-----------------+-----------------+
# | Health | No oil added    | No-oil-added    |
# +--------+-----------------+-----------------+
# | Health | No-sugar        | low-sugar       |
# +--------+-----------------+-----------------+
# | Health | Paleo           | paleo           |
# +--------+-----------------+-----------------+
# | Health | Peanuts         | peanut-free     |
# +--------+-----------------+-----------------+
# | Health | Pescatarian     | pescatarian     |
# +--------+-----------------+-----------------+
# | Health | Pork-free       | pork-free       |
# +--------+-----------------+-----------------+
# | Health | Red meat-free   | red-meat-free   |
# +--------+-----------------+-----------------+
# | Health | Sesame-free     | sesame-free     |
# +--------+-----------------+-----------------+
# | Health | Shellfish       | shellfish-free  |
# +--------+-----------------+-----------------+
# | Health | Soy             | soy-free        |
# +--------+-----------------+-----------------+
# | Health | Sugar-conscious | sugar-conscious |
# +--------+-----------------+-----------------+
# | Health | Tree Nuts       | tree-nut-free   |
# +--------+-----------------+-----------------+
# | Health | Vegan           | vegan           |
# +--------+-----------------+-----------------+
# | Health | Vegetarian      | vegetarian      |
# +--------+-----------------+-----------------+
# | Health | Wheat-free      | wheat-free      |
# +--------+-----------------+-----------------+

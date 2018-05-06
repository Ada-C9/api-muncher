require 'httparty'

class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  @recipe_list = []

  def self.find_recipes(query)
    @recipe_list.clear

    response = HTTParty.get("#{URL}?q=#{query}&app_id=#{ID}&app_key=#{KEY}&to=50")
    # raise

    if response["hits"] && response["count"] > 0
      response.parsed_response["hits"].each do |hit|
        info_hash = {
          title: hit["recipe"]["label"],
          id: hit["recipe"]["uri"].match(/[^_]*$/)[0],
          image: hit["recipe"]["image"]
        }

        @recipe_list << Recipe.new(info_hash)
      end
    end
    return @recipe_list
  end

  def self.find(id)

    # Format recipe id into Edaman id:
    edaman_id = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}"
    # edaman_id = "http://www.edamam.com/ontologies/edamam.owl#recipe_#{id}" encoded

    # Make request:
    response = HTTParty.get("#{URL}?r=#{edaman_id}&app_id=#{ID}&app_key=#{KEY}").parsed_response

    # define recipe details in new variable only if recipe is found by api:
    if response[0] && response[0]["uri"] == URI.decode(edaman_id)
      response.each do |hit|
        info_hash = {
          title: hit["label"],
          id: hit["uri"].match(/[^_]*$/)[0],
          image: hit["image"],
          source: hit["source"],
          url: hit["url"],
          portion: hit["yield"],
          ingredients: hit["ingredientLines"],
          diet: hit["dietLabels"]
        }

        @recipe = Recipe.new(info_hash)
      end
    end
    return @recipe

  end
end

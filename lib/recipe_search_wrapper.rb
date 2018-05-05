require 'httparty'


class RecipeSearchWrapper
  @app_id = ENV["APPLICATION_ID"]
  @app_key = ENV["APPLICATION_KEY"]
  @base_url = "https://api.edamam.com/search?"

  class RecipeError < StandardError; end

  def self.search_recipes(query)
    url = @base_url  + "app_id=#{@app_id}&app_key=#{@app_key}" + "&q=#{query}" + "&to=20"

    encoded_uri = URI.encode(url)

    response = HTTParty.get(encoded_uri).parsed_response

    #response["hits"][0]["recipe"]["label"] => teriyaki chicken

    #raw_recipe["recipe"]["label"] => teriyaki chicken

    recipes = []
    #should I handle of nil/empty response["hits"] here?
    # response["hits"].map do |raw_recipe|
    #   recipe = raw_recipe["recipe"]
    #   recipes << Recipe.from_api(recipe)
    # end
    if response["hits"]
      response["hits"].each do |hit|
        label = hit["recipe"]["label"]
        uri = hit["recipe"]["uri"]
        opts = {}
        opts["image"] = hit["recipe"]["image"]
        # recipes << Recipe.from_api(label, uri, opts)
        recipes << Recipe.new(uri, label, opts)
      end
    end
    return recipes
  end


  def self.find_recipe(uri)
    #successful get https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_2463f2482609d7a471dbbf3b268bd956

    encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{@app_id}&app_key=#{@app_key}&r=" + uri)

    response = HTTParty.get(encoded_uri).parsed_response
    #response[0]
    uri = response[0]["uri"]
    label = response[0]["label"]
    opts = {}
    opts["image"] = response[0]["image"]
    opts["url"] = response[0]["url"]
    opts["servings"] = response[0]["yield"]
    opts["ingredients"] = response[0]["ingredientLines"]
    opts["health_labels"] = response[0]["healthLabels"]
    opts["calories"] = response[0]["calories"]
    opts["fat"] = response[0]["FAT"]
    opts["saturated_fat"] = response[0]["FASAT"]
    opts["mono_fat"] = response[0]["FAMS"]
    opts["carbs"] = response[0]["CHOCDF"]
    opts["protein"] = response[0]["PROCNT"]
    opts["sodium"] = response[0]["NA"]
    opts["fiber"] = response[0]["FIBTG"]
    opts["cholesterol"] = response[0]["CHOLE"]
    recipe = Recipe.new(uri, label, opts)
    return recipe
  end

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise RecipeError.new(response["error"])
    end
  end

end

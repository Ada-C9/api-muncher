require 'httparty'


class RecipeSearchWrapper
  @app_id = ENV["APPLICATION_ID"]
  @app_key = ENV["APPLICATION_KEY"]
  @base_url = "https://api.edamam.com/search?"

  class RecipeError < StandardError; end

  def self.search_recipes(query)
    url = @base_url  + "app_id=#{@app_id}&app_key=#{@app_key}" + "&q=#{query}" + "&to=100"

    encoded_uri = URI.encode(url)

    response = HTTParty.get(encoded_uri).parsed_response

    # raise_on_error(response)

    recipes = []

    if response["hits"]
      response["hits"].each do |hit|
        label = hit["recipe"]["label"]
        uri = hit["recipe"]["uri"]
        opts = {}
        opts["image"] = hit["recipe"]["image"]

        recipes << Recipe.new(uri, label, opts)
      end
    end
    return recipes
  end


  def self.find_recipe(uri)

    encoded_uri = URI.encode("https://api.edamam.com/search?app_id=#{@app_id}&app_key=#{@app_key}&r=" + uri)

    response = HTTParty.get(encoded_uri).parsed_response

    # raise_on_error(response)

    unless response.empty?
      uri = response[0]["uri"]
      label = response[0]["label"]
      opts = {}
      opts["image"] = response[0]["image"]
      opts["url"] = response[0]["url"]
      opts["servings"] = response[0]["yield"]
      opts["ingredients"] = response[0]["ingredientLines"]
      opts["health_labels"] = response[0]["healthLabels"]
      opts["calories"] = response[0]["calories"]
      opts["fat"] = response[0]["totalNutrients"]["FAT"]["quantity"]
      opts["saturated_fat"] = response[0]["totalNutrients"]["FASAT"]["quantity"]
      opts["mono_fat"] = response[0]["totalNutrients"]["FAMS"]["quantity"]
      opts["carbs"] = response[0]["totalNutrients"]["CHOCDF"]["quantity"]
      opts["protein"] = response[0]["totalNutrients"]["PROCNT"]["quantity"]
      opts["sodium"] = response[0]["totalNutrients"]["NA"]["quantity"]
      opts["fiber"] = response[0]["totalNutrients"]["FIBTG"]["quantity"]
      opts["cholesterol"] = response[0]["totalNutrients"]["CHOLE"]["quantity"]
      @recipe = Recipe.new(uri, label, opts)
      return @recipe
    else
      RecipeError.new("We couldn't find that recipe. Maybe you could write it?")
    end
  end

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise RecipeError.new(response["error"])
    end
  end

end

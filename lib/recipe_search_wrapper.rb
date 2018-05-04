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
    puts response

    #response["hits"][0]["recipe"]["label"] => teriyaki chicken

    #raw_recipe["recipe"]["label"] => teriyaki chicken

    recipes = []
    #should I handle of nil/empty response["hits"] here?
    response["hits"].map do |raw_recipe|
      recipe = raw_recipe["recipe"]
      recipes << Recipe.from_api(recipe)
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
    image = response[0]["image"]
    url = response[0]["url"]
    servings = response[0]["yield"]
    ingredients = response[0]["ingredients"]
    health_labels = response[0]["healthLabels"]
    calories = response[0]["calories"]
    fat = response[0]["FAT"]
    saturated_fat = response[0]["FASAT"]
    mono_fat = response[0]["FAMS"]
    carbs = response[0]["CHOCDF"]
    protein = response[0]["PROCNT"]
    sodium = response[0]["NA"]
    fiber = response[0]["FIBTG"]
    cholesterol = response[0]["CHOLE"]
    recipe = Recipe.new(
        uri,
        label,
        image,
        url,
        servings,
        ingredients,
        health_labels,
        calories,
        fat,
        saturated_fat,
        mono_fat,
        carbs,
        protein,
        sodium,
        fiber,
        cholesterol
      )
      return recipe
  end

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise RecipeError.new(response["error"])
    end
  end

end

class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :uri, :label, :url, :servings, :ingredients, :health_labels, :calories, :fat, :saturated_fat, :mono_fat, :carbs, :protein, :sodium, :fiber, :cholesterol

  def initialize(
    uri: uri,
    label: label,
    url: url,
    servings: servings,
    ingredients: ingredients,
    health_labels: health_labels,
    calories: calories,
    fat: fat,
    saturated_fat: saturated_fat,
    mono_fat: mono_fat,
    carbs: carbs,
    protein: protein,
    sodium: sodium,
    fiber: fiber,
    cholesterol: cholesterol
  )

    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end

    @uri = uri
    @label = label
    @url = url
    @servings = servings
    @ingredients = ingredients
    @health_labels = health_labels
    @calories = calories
    @fat = fat
    @saturated_fat = saturated_fat
    @mono_fat = mono_fat
    @carbs = carbs
    @protein = protein
    @sodium = sodium
    @fiber = fiber
    @cholesterol = cholesterol

  end

  def self.from_api(raw_recipe)
    # self.new(
    #   uri: raw_recipe["recipe"]["uri"],
    #   label: raw_recipe["recipe"]["label"],
    #   url: raw_recipe["recipe"]["url"],
    #   servings: raw_recipe["recipe"]["yield"],
    #   ingredients: raw_recipe["recipe"]["ingredientLines"],
    #   health_labels: raw_recipe["recipe"]["healthLabels"],
    #   calories: raw_recipe["recipe"]["calories"],
    #   fat: raw_recipe["recipe"]["totalNutrients"]["FAT"]["quantity"],
    #   saturated_fat: raw_recipe["recipe"]["totalNutrients"]["FASAT"]["quantity"],
    #   mono_fat: raw_recipe["recipe"]["totalNutrients"]["FAMS"]["quantity"],
    #   carbs: raw_recipe["recipe"]["totalNutrients"]["CHOCDF"]["quantity"],
    #   protein: raw_recipe["recipe"]["totalNutrients"]["PROCNT"]["quantity"],
    #   sodium: raw_recipe["recipe"]["totalNutrients"]["NA"]["quantity"],
    #   fiber: raw_recipe["recipe"]["totalNutrients"]["FIBTG"]["quantity"],
    #   cholesterol: raw_recipe["recipe"]["totalNutrients"]["CHOLE"]["quantity"]
    # )
    self.new(
      uri: raw_recipe["uri"],
      label: raw_recipe["label"],
      url: raw_recipe["url"],
      servings: raw_recipe["yield"],
      ingredients: raw_recipe["ingredientLines"],
      health_labels: raw_recipe["healthLabels"],
      calories: raw_recipe["calories"],
      fat: raw_recipe["totalNutrients"]["FAT"]["quantity"],
      saturated_fat: raw_recipe["totalNutrients"]["FASAT"]["quantity"],
      mono_fat: raw_recipe["totalNutrients"]["FAMS"]["quantity"],
      carbs: raw_recipe["totalNutrients"]["CHOCDF"]["quantity"],
      protein: raw_recipe["totalNutrients"]["PROCNT"]["quantity"],
      sodium: raw_recipe["totalNutrients"]["NA"]["quantity"],
      fiber: raw_recipe["totalNutrients"]["FIBTG"]["quantity"],
      cholesterol: raw_recipe["totalNutrients"]["CHOLE"]["quantity"]
    )
  end

  def find_recipe(uri)
    #successful get https://api.edamam.com/search?app_id=#{app_id}&app_key=#{app_key}&r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_2463f2482609d7a471dbbf3b268bd956
    encoded_uri = URI.encode("https://api.edamam.com/search?r=" + uri)

    response = HTTParty.get(encoded_uri).parsed_response

    return response["hit"]
  end
end

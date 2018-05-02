class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :label, :url, :ingredients, :health_labels, :calories, :fat, :saturated_fat, :mono_fat, :carbs, :protein, :sodium, :fiber, :cholesterol

  def initialize(
    label: label,
    url: url,
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
    cholesterol: cholesterol)

    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end

    @label = label
    @url = url
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
    self.new(
      label: raw_recipe["recipe"]["label"],
      url: raw_recipe["recipe"]["url"],
      ingredients: raw_recipe["recipe"]["ingredientLines"],
      health_labels: raw_recipe["recipe"]["healthLabels"],
      calories: raw_recipe["recipe"]["calories"],
      fat: raw_recipe["recipe"]["totalNutrients"]["FAT"]["quantity"],
      saturated_fat: raw_recipe["recipe"]["totalNutrients"]["FASAT"]["quantity"],
      mono_fat: raw_recipe["recipe"]["totalNutrients"]["FAMS"]["quantity"],
      carbs: raw_recipe["recipe"]["totalNutrients"]["CHOCDF"]["quantity"],
      protein: raw_recipe["recipe"]["totalNutrients"]["PROCNT"]["quantity"],
      sodium: raw_recipe["recipe"]["totalNutrients"]["NA"]["quantity"],
      fiber: raw_recipe["recipe"]["totalNutrients"]["FIBTG"]["quantity"],
      cholesterol: raw_recipe["recipe"]["totalNutrients"]["CHOLE"]["quantity"]
    )
  end
end

class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :uri, :label, :image, :url, :servings, :ingredients, :health_labels, :calories, :fat, :saturated_fat, :mono_fat, :carbs, :protein, :sodium, :fiber, :cholesterol

  #this is a really annoying amount of arguments to require
  def initialize(
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

    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end

    if uri.nil? || uri.empty?
      raise ArgumentError.new("The recipe needs a URI")
    end

    @uri = uri
    @label = label
    @image = image
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
    self.new(
      raw_recipe["uri"],
      raw_recipe["label"],
      raw_recipe["image"],
      raw_recipe["url"],
      raw_recipe["yield"],
      raw_recipe["ingredientLines"],
      raw_recipe["healthLabels"],
      raw_recipe["calories"],
      raw_recipe["totalNutrients"]["FAT"]["quantity"],
      raw_recipe["totalNutrients"]["FASAT"]["quantity"],
      raw_recipe["totalNutrients"]["FAMS"]["quantity"],
      raw_recipe["totalNutrients"]["CHOCDF"]["quantity"],
      raw_recipe["totalNutrients"]["PROCNT"]["quantity"],
      raw_recipe["totalNutrients"]["NA"]["quantity"],
      raw_recipe["totalNutrients"]["FIBTG"]["quantity"],
      raw_recipe["totalNutrients"]["CHOLE"]["quantity"]
    )
  end

end

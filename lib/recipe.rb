class Recipe
  #change this to be like http://eric-price.net/blog/rails-api-wrapper/
  attr_reader :uri, :label, :image, :url, :servings, :ingredients, :health_labels, :calories, :fat, :saturated_fat, :mono_fat, :carbs, :protein, :sodium, :fiber, :cholesterol

  #this is a really annoying amount of arguments to require
  def initialize(uri, label, opts = {})

    if label.nil? || label.empty?
      raise ArgumentError.new("The recipe needs a label")
    end

    if uri.nil? || uri.empty?
      raise ArgumentError.new("The recipe needs a URI")
    end

    @uri = uri
    @label = label
    @image = opts["image"]
    @url = opts["url"]
    @servings = opts["servings"]
    @ingredients = opts["ingredients"]
    @health_labels = opts["health_labels"]
    @calories = opts["calories"]
    @fat = opts["fat"]
    @saturated_fat = opts["saturated_fat"]
    @mono_fat = opts["mono_fat"]
    @carbs = opts["carbs"]
    @protein = opts["protein"]
    @sodium = opts["sodium"]
    @fiber = opts["fiber"]
    @cholesterol = opts["cholesterol"]

  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["uri"],
      raw_recipe["label"],
      opts = {}
    )
      opts["image"] = raw_recipe["image"],
      opts["url"] = raw_recipe["url"],
      opts["yield"] = raw_recipe["yield"],
      opts["ingredientLines"] = raw_recipe["ingredientLines"],
      opts["healthLabels"] = raw_recipe["healthLabels"],
      opts["calories"] = raw_recipe["calories"],
      opts["fat"] = raw_recipe["totalNutrients"]["FAT"]["quantity"],
      opts["saturated_fat"] = raw_recipe["totalNutrients"]["FASAT"]["quantity"],
      opts["mono_fat"] = raw_recipe["totalNutrients"]["FAMS"]["quantity"],
      opts["carbs"] = raw_recipe["totalNutrients"]["CHOCDF"]["quantity"],
      opts["protein"] = raw_recipe["totalNutrients"]["PROCNT"]["quantity"],
      opts["sodium"] = raw_recipe["totalNutrients"]["NA"]["quantity"],
      opts["fiber"] = raw_recipe["totalNutrients"]["FIBTG"]["quantity"],
      opts["cholesterol"] = raw_recipe["totalNutrients"]["CHOLE"]["quantity"]

  end

end

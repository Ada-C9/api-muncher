class Recipe
  attr_reader :label, :image, :source, :link, :time, :calories, :ingredients, :nutrition_info

  def initialize(recipe)
    raise ArgumentError if recipe == nil

    @label = recipe["label"]
    @image = recipe["image"]
    @source = recipe["source"]
    @link = recipe["url"]

    recipe["totalTime"] == 0.0 ? @time = "Unknown" : @time = recipe["totalTime"]

    @calories = recipe["calories"].to_f.round
    @ingredients = get_ingredients(recipe)
    @nutrition_info = get_nutrition_info(recipe)
  end

  def self.from_api(recipe)
    self.new(recipe)
  end

  # intake info from subarray of nutrition_info
  def percent_of_rec(total_amt, daily_recommended)
    if daily_recommended.to_f == 0
      return "-"
    else
      decimal = total_amt.to_f / daily_recommended.to_f
      percent = (decimal * 100).round
      return percent
    end
  end

  private

  def get_ingredients(recipe)
    ingredients = []
    recipe["ingredients"].each do |i|
      ingredients << i["text"]
    end
    return ingredients
  end

  def get_nutrition_info(recipe)
    nutrition_info = []
    recipe["digest"].each_with_index do |d, i|
      n_num = "nutrient" + (i + 1).to_s
      n_num = {}
      n_num["nutrient"] = d["label"]
      n_num["total_amt"] = d["total"]
      n_num["daily_recommended"] = d["daily"]
      n_num["unit"] = d["unit"]
      nutrition_info << n_num
    end
    return nutrition_info
  end

end

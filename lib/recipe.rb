class Recipe
  attr_reader :label, :image, :source, :link, :time, :calories, :ingredients, :nutrition_info

  def initialize(recipe)
    raise StandardError if recipe == nil

    @label = recipe["label"]
    @image = recipe["image"]
    @source = recipe["source"]
    @link = recipe["url"]

    recipe["totalTime"] == 0.0 ? @time = "Unknown" : @time = recipe["totalTime"].round

    @calories = recipe["calories"].round
    @ingredients = recipe["ingredients"]
    @nutrition_info = recipe["digest"]
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

end

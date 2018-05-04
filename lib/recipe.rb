class Recipe
  # paginates_per 8
  attr_reader :label, :image, :calories, :url

  def initialize(label, image, calories, url)
    @label = label
    @image = image
    @calories = calories
    @url = url
  end

  def self.from_api(raw_data)
    self.new(
    raw_data["recipe"]["label"],
    raw_data["recipe"]["image"],
    raw_data["recipe"]["calories"],
    raw_data["recipe"]["url"]
    )
  end


end

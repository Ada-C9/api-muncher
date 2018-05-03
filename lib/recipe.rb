class Recipe
  attr_reader :label, :image, :calories, :url

  def initialize(label, image, calories, url,uri)
    @label = label
    @image = image
    @calories = calories
    @url = url
    @uri = uri
  end

  def self.from_api(raw_data)
    self.new(
    raw_data["label"],
    raw_data["image"],
    raw_data["calories"],
    raw_data["url"],
    raw_data["id"]
    )
  end

end

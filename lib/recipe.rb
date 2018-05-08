
class Recipe
  attr_reader :title, :id, :image, :source, :url, :ingredients, :diet, :portion

  def initialize(info_hash, options = {})
    raise ArgumentError if info_hash.empty?

    @title = info_hash[:title]
    @id = info_hash[:id]
    @image = info_hash[:image]

    if info_hash.length > 3
      @source = info_hash[:source]
      @url = info_hash[:url]
      @portion = info_hash[:portion]
      @ingredients = info_hash[:ingredients]
      @diet = info_hash[:diet]
    end
  end

end

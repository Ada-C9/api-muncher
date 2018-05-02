class Recipe

  attr_reader :title, :author, :image, :website, :ingredients, :yield, :time, :labels

  def initialize(hash)
    @title = hash["label"] ||= "No-Name"
    @author = hash["source"] ||= "annonumous"
    @image = hash["image"]
    @website = hash["url"]
    @ingredients = hash["ingredientLines"]
    @yield = hash["yield"]
    @time = hash["totalTime"]
    @labels = hash["healthLabels"]
  end



end

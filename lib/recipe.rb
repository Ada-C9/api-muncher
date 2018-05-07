class Recipe

  attr_reader :id, :title, :author, :image, :website, :ingredients, :yield, :time, :labels

  def initialize(hash)
    @id = hash["uri"].gsub("http://www.edamam.com/ontologies/edamam.owl#recipe_", "")
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

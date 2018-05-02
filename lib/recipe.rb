class Recipe
  attr_reader :label, :uri, :url, :image, :source, :dietLabels, :healthLabels

  def initialize(params)
    @label = params[:label]
    @uri = params[:uri]
    @url = params[:url]
    @image = params[:image]
    @source = params[:source]
    @dietLabels = params[:dietLabels]
    @healthLabels = params[:healthLabels]
  end
end

class Recipe
  attr_reader :label, :uri, :url, :image, :source, :diet_labels, :health_labels, :ingredient_lines

  def initialize(params)
    @label = params[:label]
    @uri = params[:uri]
    @url = params[:url]
    @image = params[:image]
    @source = params[:source]
    @ingredient_lines = params[:ingredient_lines]
    @diet_labels = params[:diet_labels]
    @health_labels = params[:health_labels]

    raise ArgumentError if @label.nil? || @label.empty? || @uri.nil? || @uri.empty?
  end
end

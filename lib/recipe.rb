class Recipe
  attr_reader :label, :uri, :options

  def initialize(label, uri, options = {})
    @label = label
    @uri = uri
    @options = options
  end

end

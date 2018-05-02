require 'httparty'

class Recipe
  attr_reader :name, :id

  def initialize(name, id, options = {})
    @name = name
    @id = id
  end

end

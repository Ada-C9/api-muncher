class Recipe
  attr_reader :name, :picture
  def initialize(name, picture)
    valid_attribute(name)
    valid_attribute(picture)

    @name = name
    @picture = picture
  end




  private

  def valid_attribute?(attribute)
    if attribute.nil? || attribute.empty?
      raise ArgumentError.new("Need a valid #{attribute}, please!")
    end
  end

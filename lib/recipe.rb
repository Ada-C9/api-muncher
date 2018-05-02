class Channel

  attr_reader :name, :id

  def initialize(name, id)
    # # Note that the below we used lazy evaluation to
    # # our advantage here
    # # Boolean logic short cercut
    # if name.nil? || name.empty?
    #   raise ArgumentError.new("Need a name please")
    # end

    @name = name
    @id = id
  end

  def self.from_api(raw_recipe)
    self.new(
      raw_recipe["name"],
      raw_recipe["id"]
    )
  end
end

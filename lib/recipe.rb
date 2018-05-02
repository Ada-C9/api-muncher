class Recipe
  attr_reader :label, :image, :url

  def initialize(label, image, url)
    #note that we use lazy evaluation to our advantage here. Also nil.empty? would raise a different error
    if label.nil? || label.empty?
      raise ArgumentError.new("Need a name pls")
    end

    @label = label
    @image = image
    @url = url
  end

#this is a factory method! it reads the data we got back from the api, and turns it into an instance of channel by calling self.new
  def self.from_api(raw_recipe)
    self.new(raw_recipe["label"], raw_recipe["image"], )
  end
end

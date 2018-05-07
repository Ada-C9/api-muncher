require 'test_helper'

describe Recipe do

  it "Must initialize uri & label properly" do
    VCR.use_cassette("recipes") do
    recipe = Recipe.new("Uri", "Label")
    recipe.uri.must_equal "Uri"
    recipe.label.must_equal "Label"
    end
  end

  it "Cannot be initialized with fewer than 2 parameters" do
    VCR.use_cassette("recipes") do
      proc {
        Recipe.new
      }.must_raise ArgumentError

      proc {
        Recipe.new "Name"
      }.must_raise ArgumentError
    end
  end

end

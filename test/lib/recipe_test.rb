require 'test_helper'
describe Recipe do
  it "Cannot be initialized with less than 6 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "Name"
    }.must_raise ArgumentError
  end

  it "Must initialize all parameters properly" do
    recipe = Recipe.new("name", "uri", "image", "dietlabels", "ingredients", "source")
    recipe.name.must_equal "name"
    recipe.uri.must_equal "uri"
  end
end

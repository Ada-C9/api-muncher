require 'test_helper'

describe Recipe do
  it "can be created" do
    recipe = Recipe.new("label", "uri")
    recipe.must_be_instance_of Recipe
    recipe.must_respond_to :label
    recipe.label.must_equal "label"
    recipe.id.must_equal "uri"
  end

  it "must have two parameters" do
    proc { Recipe.new }.must_raise ArgumentError
    proc { Recipe.new "label"}.must_raise ArgumentError
    proc { Recipe.new "uri"}.must_raise ArgumentError
  end



end

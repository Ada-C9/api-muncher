require 'test_helper'

describe EdamamApiWrapper do

  it "displays results for a valid ingredient search" do
    VCR.use_cassette("recipe") do
      recipes = EdamamApiWrapper.list_recipes("chicken")
      recipes.count.wont_be_nil
    end
  end

  it "returns an empty array with an invalid ingredient" do
    VCR.use_cassette("recipe") do
      recipes = EdamamApiWrapper.list_recipes("unsefwbsfie")
      recipes.must_equal []
    end
  end
end

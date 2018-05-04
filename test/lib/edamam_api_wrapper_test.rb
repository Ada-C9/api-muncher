require 'test_helper'

describe EdamamApiWrapper do

  it "displays results for a valid ingredient search" do
    VCR.use_cassette("recipe") do
      recipes = EdamamApiWrapper.list_recipes("chicken")
      recipes.count.wont_be_nil
      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end
  end

  it "returns an empty array with an invalid ingredient" do
    VCR.use_cassette("recipe") do
      recipes = EdamamApiWrapper.list_recipes("")
      recipes.must_equal []
    end
  end

  it "gets the correct recipe for an ID" do
    VCR.use_cassette("recipe") do
      recipe = EdamamApiWrapper.get_recipe("7bf4a371c6884d809682a72808da7dc2")
      recipe.name.must_equal  "Teriyaki Chicken"
    end
  end

  it "returns nil if the recipe does not exist" do
    VCR.use_cassette("recipe1") do
      recipe = EdamamApiWrapper.get_recipe("fjkecs")
      recipe.must_be_nil
    end
  end
end

require 'test_helper'
require 'pry'
describe EdamamApiWrapper do

  it "Can return array of recipes based on query" do
    VCR.use_cassette("recipes") do
      query = "chicken"
      recipe_list = EdamamApiWrapper.list_recipes(query)
      recipe_list.must_be_kind_of Array
    end
  end

  it "Returns empty array if there are no query matches" do
    VCR.use_cassette("recipes2") do
      query = 24324234234234.2342432432
      recipe_list = EdamamApiWrapper.list_recipes(query)
      recipe_list.must_be_empty
    end
  end

end

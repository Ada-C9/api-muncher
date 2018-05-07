require 'test_helper'

describe EdamamApiWrapper do
  it "Can search API with valid query" do
    VCR.use_cassette("recipes") do
      query = "chicken"
      response = EdamamApiWrapper.search(query)
      response.must_be_kind_of Recsearch
    end
  end

  it "Returns nil if search does not find recipes" do
    VCR.use_cassette("recipes") do
      query = "something that doesnt exist"
      response = EdamamApiWrapper.search(query)
      response.must_be_nil
    end
  end

  it "returns single recipe if searching single" do
    VCR.use_cassette("recipes") do
      id = "67b2867627c159e4f5bbaf2431b3ccb6"
      response = EdamamApiWrapper.single_search(id)
      response.must_be_kind_of Recipe
    end
  end

end

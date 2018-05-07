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

end

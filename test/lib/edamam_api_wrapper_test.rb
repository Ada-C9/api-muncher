require 'test_helper'

describe EdamamApiWrapper do

  it "Can receive valid data from Edamam for a recipe" do
  VCR.use_cassette("recipes") do
    response = EdamamApiWrapper.find_recipes("chicken")

    response.must_be_kind_of Array
    assert response.any?

  end
  end


end

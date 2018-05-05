require 'test_helper'

describe EdamamApiWrapper do

  it "Can send valid message to real channel" do
    VCR.use_cassette("recipes") do
      message = "test message"
      response = EdamamApiWrapper.search_for("chicken")
      response[""].must_equal true
    end
  end

  it "Can't search for non-existent food-item" do
    VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.search_for("asfd")
      response[""].must_equal false
    end
  end

  it "Can't search for a blank" do
    VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.search_for("asfd")
      response[""].must_equal false
    end
  end

  # write ones for show_recipe method
end

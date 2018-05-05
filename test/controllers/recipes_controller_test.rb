require "test_helper"

describe RecipesController do
  it "should get index" do
    get recipes_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get recipes_show_url
    value(response).must_be :success?
  end

  it "INSERT CONTROLLER TEST DESCRIPTION HERE" do
    VCR.use_cassette("YOURCONTROLLERTESTCASSETTEFILENAMEHERE") do
      # INSERT ALL OF THE CONTROLLER TEST HERE
    end
  end

end

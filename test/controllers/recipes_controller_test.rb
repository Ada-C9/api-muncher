require "test_helper"

describe RecipesController do
  it "should get index" do
    get recipes_path
    value(response).must_be :success?
  end

  it "should get show" do
    # get recipe_path("https://api.edamam.com/search?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_42c0f6c2441352c5900eee4ce9f3f7e0&app_id=b5d11fdb&app_key=acb92014864c5ed52b1686c4f607bda4")
    #
    # must_respond_with :success

  end

  it "INSERT CONTROLLER TEST DESCRIPTION HERE" do
    VCR.use_cassette("YOURCONTROLLERTESTCASSETTEFILENAMEHERE") do
      # INSERT ALL OF THE CONTROLLER TEST HERE
    end
  end

end

require "test_helper"

describe RecipesController do
  it "should get index show new edit delete update create destroy" do
    get recipes_index show new edit delete update create destroy_url
    value(response).must_be :success?
  end

end

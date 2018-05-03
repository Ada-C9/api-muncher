require "test_helper"

describe RecipesController do

  it "should get home" do
    get root_path
    value(response).must_be :success?
  end


  it "should get index" do
    get recipes_path
    value(response).must_be :success?
  end

  it "should get show" do
    get recipe_path
    value(response).must_be :success?
  end

end

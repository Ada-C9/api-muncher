require "test_helper"

describe RecipesController do
  it "can get the index path" do
    get recipes_path

    must_respond_with :more
  end

  it "can get the main path" do
    get root_path

    must_respond_with :more
  end

  it "can get the show path" do
    post recipes_path

    must_respond_with :more
  end
end

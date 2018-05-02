require "test_helper"

describe RecipesController do
  it "can get the index path" do
    get root_path

    must_respond_with :ok
  end

  it "can get the recipe show view" do
    get show_path("recipe")

    must_respond_with :ok
  end

  it "can add a query" do
    post search_path("recipe")

    must_redirect_to root_path
  end
end

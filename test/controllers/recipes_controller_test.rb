require "test_helper"

describe RecipesController do
  it "can access the form on the homepage" do
    get root_path

    must_respond_with :ok
  end

  it "can get the results for the search" do
      get recipes_path

      must_respond_with :ok
  end

  it "can view a specific recipe" do
    get recipe_path(uri)

    must_respond_with :ok

  end

end

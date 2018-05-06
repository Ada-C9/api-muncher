require "test_helper"

describe RecipesController do
  it "should get root" do
    VCR.use_cassette("root") do

      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "should get index" do
      VCR.use_cassette("index") do

        get recipes_path, params: {query: "chicken"}
        must_respond_with :success
      end
    end

    it "should redirect to root if query is blank" do
      get recipes_path, params: {query: ""}

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  describe "show" do
    it "should get show" do
      VCR.use_cassette("show") do

        get recipe_path ("7543ecfa28b7506a97360748f017a83e")
        must_respond_with :success
      end
    end

    it "should redirect to root with invalid id" do
      VCR.use_cassette("show") do

        get recipe_path ("000")
        must_respond_with :redirect
        must_redirect_to root_path
      end
    end
  end

  describe "new" do
    it "can get the new search form" do
      VCR.use_cassette("new") do

        get new_recipe_path
        must_respond_with :success
      end
    end
  end
end

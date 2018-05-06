require "test_helper"

describe RecipesController do

  describe "search" do
    it "can get the search form" do
      get search_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "can get the recipes index with a valid search" do
      VCR.use_cassette("chicken") do
        get index_path, params: { search: 'chicken' }
        must_respond_with :success
      end
    end

    # still succeeds bc view tells user there's no results
    it "can't get a recipes index with an invalid search" do
      VCR.use_cassette("fake abc") do
        get index_path, params: { search: 'fake abd' }
        must_respond_with :success
      end
    end
  end

  describe "show" do
    it "can get the recipe's info with a valid id" do
      VCR.use_cassette("chicken") do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")
        id = recipe_list.first[:id]

        get recipe_path(id)
        must_respond_with :success
      end
    end

    it "can't get the recipe's info and redirects with invalid id" do
      VCR.use_cassette("chicken") do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")
        id = recipe_list.first[:id] + "abc"

        get recipe_path(id)
        flash[:notice].must_equal "Something went wrong. Please enter a new search."
        must_respond_with :redirect
        must_redirect_to search_path
      end
    end
  end

end

require "test_helper"

describe RecipesController do

  describe "search" do
    it "can display the search form" do
      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "displays a list of recipes for a valid query" do
    end

    it "displays empty index if the queryt yields no results" do
    end
  end

  describe "show" do
    it "can display the show page for a valid recipe from the query" do
    end

    it "redirects to a 404 page if the recipe uri is invalid" do
    end
  end
end

require "test_helper"

describe RecipesController do
  let(:valid_search) { "cake" }
  let(:invalid_search) { "?" }

  describe "root" do
    it "succeeds" do
      get root_path
      must_respond_with :success
    end
  end

  describe "list" do
    it "returns an array of recipes with valid search text" do
      VCR.use_cassette("recipe") do
        search = valid_search
        response = RecipeSearchWrapper.list_recipes(search)
        response.must_be_kind_of Array
        response.all? {|recipe| recipe.must_be_kind_of Recipe}
      end
    end

    it "returns an empty array with invalid search" do
      VCR.use_cassette("no_recipe") do
        search = invalid_search
        response = RecipeSearchWrapper.list_recipes(search)
        response.must_equal []
      end
    end

    it "returns an empty array with empty string" do
      VCR.use_cassette("no_recipe") do
        search = invalid_search
        response = RecipeSearchWrapper.list_recipes(search)
        response.must_equal []
      end
    end
  end

end

require "test_helper"

describe RecipesController do
  let(:valid_search) { "cake" }
  let(:invalid_search) { "?" }
  let(:valid_id) { "_b66666d5c882ca199f43def8f1b8a03f" }
  let(:invalid_id) { "1b8a03f" }

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

  describe "show" do
    it "returns one recipe for a valid id" do
      VCR.use_cassette("search_recipe") do
        recipes = RecipeSearchWrapper.list_recipes(valid_search)
        response = RecipeSearchWrapper.find_recipe(valid_id)
        response.id.must_equal valid_id
        response.must_be_kind_of Recipe
      end
    end

    it "returns nil if the recipe was not found" do
      VCR.use_cassette("recipe") do
        recipes = RecipeSearchWrapper.list_recipes(valid_search)
        response = RecipeSearchWrapper.find_recipe(invalid_id)
        response.must_be_nil
      end
    end
  end

end

require 'test_helper'

describe RecipeSearchWrapper do
  let(:valid_search) { "cake" }
  let(:invalid_search) { "?" }
  let(:valid_id) { "_b66666d5c882ca199f43def8f1b8a03f" }
  let(:invalid_id) { "1b8a03f" }

  describe "list_recipes(search)" do
    it "returns an array of Recipes for a valid search" do
      VCR.use_cassette("recipe") do
        response = RecipeSearchWrapper.list_recipes(valid_search)
        response.must_be_kind_of Array
        response.all? {|recipe| recipe.must_be_kind_of Recipe}
      end
    end

    it "returns [] for an unsuccessful search" do
      VCR.use_cassette("no_recipe") do
        response = RecipeSearchWrapper.list_recipes(invalid_search)
        response.must_equal []
      end
    end

    it "returns [] for no search" do
      VCR.use_cassette("no_recipe") do
        response = RecipeSearchWrapper.list_recipes("")
        response.must_equal []
      end
    end
  end

  describe "find_recipe(id)" do
    it "returns a Recipe instance for a valid id" do
      VCR.use_cassette("search_recipe") do
        RecipeSearchWrapper.list_recipes(valid_search)
        response = RecipeSearchWrapper.find_recipe(valid_id)
        response.id.must_equal valid_id
        response.must_be_kind_of Recipe
      end
    end

    it "returns nil for an invalid id" do
      VCR.use_cassette("no_recipe") do
        RecipeSearchWrapper.list_recipes(valid_search)
        response = RecipeSearchWrapper.find_recipe(invalid_id)
        response.must_be_nil
      end
    end
  end
end

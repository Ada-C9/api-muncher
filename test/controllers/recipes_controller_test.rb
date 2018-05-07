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
    it "must succeed with valid search text" do
      VCR.use_cassette("recipe") do
        get search_results_path
        response = RecipeSearchWrapper.list_recipes(valid_search)
        must_respond_with :found
      end
    end

    it "must redirect_to root with invalid search" do
      VCR.use_cassette("no_recipe") do
        get search_results_path
        search = invalid_search
        response = RecipeSearchWrapper.list_recipes(search)
        must_redirect_to root_path
      end
    end

    it "must redirect_to with empty string" do
      VCR.use_cassette("no_recipe") do
        get search_results_path
        response = RecipeSearchWrapper.list_recipes("")
        must_redirect_to root_path
      end
    end
  end

  describe "show" do
    it "succeeds with a valid id" do
      VCR.use_cassette("search_recipe") do
        get search_results_path
        search = valid_search
        RecipeSearchWrapper.list_recipes(search)

        get recipe_show_path(valid_id)
        RecipeSearchWrapper.find_recipe(valid_id)
        must_respond_with :ok
      end
    end

    it "redirects to list page if the recipe was not found" do
      VCR.use_cassette("no_recipe") do
        get search_results_path
        RecipeSearchWrapper.list_recipes(valid_search)
        get recipe_show_path(invalid_id)
        RecipeSearchWrapper.find_recipe(invalid_id)
        must_redirect_to search_results_path
      end
    end
  end

end

require "test_helper"

describe "RecipesController" do
  describe "root" do
    it "shows the root page" do
      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "returns a list of search recipes results" do
      query = "chicken"
      VCR.use_cassette("recipes") do
        RecipeSearchWrapper.search_recipes(query)

        get query_recipe_path(query: query)
        must_respond_with :success
      end
    end
  end


end

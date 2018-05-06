require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  describe 'index' do
    it "returns a list of search recipes results" do
      query = "chicken"
      VCR.use_cassette("recipes") do
        RecipeSearchWrapper.list_recipes(query)
        get recipes_path(query: query)

        must_respond_with :success
      end
    end

    it "won't return anything for a search term with no results" do
      query = "hjn2w0qq"
      VCR.use_cassette("recipes") do
        RecipeSearchWrapper.search_recipes(query)

        get recipes_path(query: query)
        must_redirect_to root_path
      end
    end
  end
end

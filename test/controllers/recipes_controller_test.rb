require "test_helper"

describe RecipesController do
  let(:valid_search) { "cake" }

  describe "root" do
    it "succeeds" do
      get root_path
      must_respond_with :success
    end
  end

  describe "list" do
    it "succeeds with valid search text" do
      VCR.use_cassette("recipe") do
        search = valid_search
        response = RecipeSearchWrapper.list_recipes(search)
        binding.pry
        # response["ok"].must_equal true
        # response["message"]["text"].must_equal message
      end
    end
  end

end

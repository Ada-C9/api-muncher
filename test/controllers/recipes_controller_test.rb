require "test_helper"

describe RecipesController do

  describe 'home' do
    it "succeeds" do
      get root_path

      must_respond_with :success
    end
  end

  describe 'index' do
    it "succeeds when valid 'term' is provided only" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {
          term: "tofu"
        }

        must_respond_with :success
      end
    end

    it "succeeds when both valid 'term' and 'page_num' are provided" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {
          term: "tofu",
          page_num: "3"
        }

        must_respond_with :success
      end
    end

    it "renders bad_request for nil term" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {
          term: nil
        }

        flash.now[:status].must_equal :failure
        flash.now[:result_text].must_equal "Please enter a valid term for searching"
        must_respond_with :bad_request
      end
    end

    it "renders bad_request for term with only spaces" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {
          term: "     "
        }

        flash.now[:status].must_equal :failure
        flash.now[:result_text].must_equal "Please enter a valid term for searching"
        must_respond_with :bad_request
      end
    end
  end

  describe 'show' do
    it "succeeds when valid recipe_id is provided" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.list_recipes("tofu", 3).first
        recipe_id = recipe.id

        get recipe_path(recipe), params: {
          recipe_id: recipe_id
        }

        must_respond_with :success
      end
    end

    it "redirects to index page for nil recipe id" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.list_recipes("tofu", 3).first

        get recipe_path(recipe), params: {
          recipe_id: nil
        }

        flash[:status].must_equal :failure
        flash[:result_text].must_equal "Could not find that recipe"
        must_respond_with :redirect
        must_redirect_to recipes_path
      end
    end

    it "redirects to index page for invalid recipe id" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.list_recipes("tofu", 3).first

        get recipe_path(recipe), params: {
          recipe_id: "12345678"
        }

        flash[:status].must_equal :failure
        flash[:result_text].must_equal "Could not find that recipe"
        must_respond_with :redirect
        must_redirect_to recipes_path
      end
    end
  end

end

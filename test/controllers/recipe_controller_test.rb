require "test_helper"

describe RecipeController do
  describe 'root' do
    it "should successfully get root view" do
      get root_path

      must_respond_with :success
    end
  end

  describe 'index' do
    it "should successfully get index view with no start_index" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: "Lemon Chicken")

        must_respond_with :success
      end
    end

    it "should successfully get index view with a start_index" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: "Lemon Chicken", start_index: 30)

        must_respond_with :success
      end
    end

    it "should redirect to root if search_terms are nil" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: nil)

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should redirect to root if search_terms are an empty string" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: "")

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should redirect to root if search_terms are an empty string" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: "    ")

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should redirect to root with search that has no results" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: "djfksdjf sdkjfk dkd")

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should successfully get index if there are no more results for a search" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_terms: "flea", start_index: 50)

        must_respond_with :success
      end
    end

    it "should redirect to root if too many requests have been made within a minute" do
      # case for the 5 request within a minute restriction
      # uncertain about the test with the VCR and without racking up the
      # monthly limit as well
    end
  end
  describe 'show' do
    it "should successfully get show view" do
      VCR.use_cassette("recipe") do
        get recipe_path("8cb51d70083e7f9d44cc1d9f2bebc738")

        must_respond_with :success
      end
    end

    it "redirect to root if recipe search return empty" do
      VCR.use_cassette("recipe") do
        get recipe_path(" ")

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

  end

end

require 'test_helper'

describe RecipesController do

  describe "index" do

    it "should sucessfully show index of all recipes with valid data in params" do

      VCR.use_cassette("recipes") do
        get search_path, params: {
          q: "avocado" ,
          page: 1
        }
      end
      must_respond_with :success
    end

    it "should redirect to root with nil q value in params" do
      VCR.use_cassette("recipes") do
        get search_path, params: {
          q: nil ,
          page: 1
        }

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should redirect to root with invalid q (ie has no recipe hits) value in params" do
      VCR.use_cassette("recipes") do
        get search_path, params: {
          q: -99999 ,
          page: 1
        }

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should redirect to root with invalid page value in params" do
      VCR.use_cassette("recipes") do
        get search_path, params: {
          q: "avocado" ,
          page: -1
        }

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end

    it "should redirect to root with invalid page and q value in params" do
      VCR.use_cassette("recipes") do
        get search_path, params: {
          q: nil ,
          page: -1
        }

        must_respond_with :redirect
        must_redirect_to root_path
      end
    end
  end

  describe "show" do

    it "should sucessfully show recipe details with valid data in params" do
      VCR.use_cassette("recipes") do
        get recipe_path, params: {
          r: "http://www.edamam.com/ontologies/edamam.owl#recipe_b7ad27e3e2c9440baca6ac8f7fac2a53"
        }
      end

      must_respond_with :success
    end

    it "should redirect to root with invalid r (uri) value in params" do
      VCR.use_cassette("recipes") do
        get recipe_path, params: {
          r: nil
        }
      end

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

end

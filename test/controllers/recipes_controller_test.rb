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


  describe "ApiMuncherWrapper.get_recipes" do

    describe "get_recipes" do

      it "Can get recipes with valid query and page number" do
        VCR.use_cassette("recipes") do
          query = "avocado"
          page = 0

          data = ApiMuncherWrapper.get_recipes(query, page)

          recipe_count = data[0].to_i
          recipes = data[2]

          recipe_count.nil?.must_equal false

          recipes[0].must_be_instance_of Recipe

          recipes[9].must_be_instance_of Recipe
        end
      end

      it "Returns an empty array of recipes and 0 recipe_count for recipe matches for invalid query" do
        VCR.use_cassette("recipes") do
          query = 999999
          page = 0

          data = ApiMuncherWrapper.get_recipes(query, page)

          recipe_count = data[0].to_i
          recipes = data[2]

          recipe_count.must_equal 0

          recipes.count.must_equal 0
        end
      end

      it "Returns an an empty array for invalid page number" do
        VCR.use_cassette("recipes") do
          query = "avocado"
          page = -999

          data = ApiMuncherWrapper.get_recipes(query, page)

          data.nil?.must_equal true
        end
      end
    end

    describe "get_recipe" do

    end

  end

end

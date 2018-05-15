require 'test_helper'

# this needs to be done in controller testing?

describe "Recipes Controller" do
  # describe "ApiMuncherWrapper" do
  #
  #   # This code goes where an API call would be made
  #   # Use the cassetee called channels to
  #   it "Can get recipes with valid query and page number" do
  #     VCR.use_cassette("recipes") do
  #       query = "avocado"
  #       page = 0
  #
  #       data = ApiMuncherWrapper.get_recipes(query, page)
  #
  #       recipe_count = data[0].to_i
  #       recipes = data[2]
  #
  #       recipe_count.nil?.must_equal false
  #
  #       recipes[0].must_be_instance_of Recipe
  #
  #       # each call to api only returns a list of 10 recipes
  #       recipes[9].must_be_instance_of Recipe
  #     end
  #   end
  #
  #   it "Returns an empty array of recipes and 0 recipe_count for recipe matches for invalid query" do
  #     VCR.use_cassette("recipes") do
  #       query = 999999
  #       page = 0
  #
  #       data = ApiMuncherWrapper.get_recipes(query, page)
  #
  #       recipe_count = data[0].to_i
  #       recipes = data[2]
  #
  #       recipe_count.must_equal 0
  #
  #       recipes.count.must_equal 0
  #     end
  #   end
  #
  #   it "Returns an empty array of recipes and 0 recipe_count for invalid page number" do
  #     VCR.use_cassette("recipes") do
  #       query = "avocado"
  #       page = -999
  #
  #       data = ApiMuncherWrapper.get_recipes(query, page)
  #
  #       recipe_count = data[0]
  #       recipes = data[2]
  #
  #       recipe_count.must_equal []
  #
  #       recipes.count.must_equal []
  #     end
  #   end
  # end

  describe "index" do

    it "should sucessfully show index of all recipes with valid data in params" do
      # should this be reliant on vcr as well??
      proc {
        get search_path, params: {
          q: "avocado" ,
          page: 1
        }
      }
      must_respond_with :success
    end

    # it "should redirect to root with invalid data in params" do
    #
    #   proc {
    #     get search_path, params: {
    #       q: "avocado" ,
    #       page: 1
    #     }
    #   }
    #   must_respond_with :redirect
    #   must_redirect_to root_path
    # end

  end

  # describe "show" do
  #
  #   it "should sucessfully show recipe details with valid data in params" do
  #
  #     proc {
  #       get recipe_path, params: {
  #         q: "avocado" ,
  #         r: "http://www.edamam.com/ontologies/edamam.owl#recipe_b7ad27e3e2c9440baca6ac8f7fac2a53"
  #       }
  #     }
  #     must_respond_with :success
  #   end
  #
  #   it "should redirect to root with invalid data in params" do
  #
  #     proc {
  #       get recipe_path, params: {
  #         q: "avocado" ,
  #         r: nil
  #       }
  #     }
  #     must_respond_with :redirect
  #     must_redirect_to root_path
  #
  #   end
  #
  # end

end

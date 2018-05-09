require "test_helper"

describe RecipesController do
  it "gets root path successfully" do
    get root_path
    must_respond_with :success
  end

  describe "index" do
    it "should get a list of recpies" do
      VCR.use_cassette("muncher") do
        get recipe_results_path
        recipes = EdamamApiWrapper.list_recipes("Nooch")
      end
      must_respond_with :found
    end

    it "redirects to root_path for empty search" do
      VCR.use_cassette("muncher") do
        get recipe_results_path
        EdamamApiWrapper.list_recipes("")
        must_respond_with :redirect
        must_redirect_to root_path
      end
    end
  end

  describe "show" do
    it "succeeds with for vaid recipe" do
      VCR.use_cassette("muncher") do
        get recipe_show_path("e00eaef6eb0546f3cd4b37f2ab87980c")
      end
      must_respond_with :success
    end
  end

end

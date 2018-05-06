require "test_helper"

describe RecipesController do

  it "gets root path successfully" do
    get root_path
    must_respond_with :success
  end

  describe "index" do

    it "should get list of recipes" do
      VCR.use_cassette("muncher") do
        get recipe_results_path
        recipes = MuncherWrapper.get_recipes("lychee")
      end
      must_respond_with :found
    end

    it "will redirect to root path if nil/empty search" do
      VCR.use_cassette("muncher") do
        get recipe_results_path
        recipes = MuncherWrapper.get_recipes("")
        must_respond_with :redirect
        must_redirect_to root_path
      end

    end
  end

  describe " show" do
    it "should suceed with valid data" do
      VCR.use_cassette("muncher") do
        get recipe_show_path("880fa62a701667f61fdef7520db6d47c")
      end
      must_respond_with :success
    end
  end

end

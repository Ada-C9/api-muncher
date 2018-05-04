require "test_helper"

describe RecipesController do
  describe "index" do
    it "can show a list of recipes with desired flavor" do

      flavor = "tofu"
      get recipes_path(flavor)

      must_respond_with :success
    end



  end
end

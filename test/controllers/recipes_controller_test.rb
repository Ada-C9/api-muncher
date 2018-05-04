require "test_helper"

describe RecipesController do
  describe "index" do
    it "can show a list of recipes with desired flavor" do
      get recipes_path, params: {flavor: "tofu"}

      must.response_with :success
    end

    

  end
end

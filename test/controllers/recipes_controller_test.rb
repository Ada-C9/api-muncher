require "test_helper"

describe RecipesController do

  it "should get home" do
    VCR.use_cassette("root_path") do
      get root_path
      must_respond_with :success
    end
  end


  it "should get index" do
    VCR.use_cassette("index_action") do
      get recipes_path, params: { search: "pesto" }
      must_respond_with :success

      get recipes_path, params: { search: " " }
      must_respond_with :success
    end
  end


  it "should get show" do
    VCR.use_cassette("recipes") do
      recipe_id = "7bf4a371c6884d809682a72808da7dc2"
      recipe = ApiMuncherWrapper.find_recipe(recipe_id)
      get recipe_path(recipe_id)

      must_respond_with :success
    end
  end

  it "should redirect to index page for nil recipe" do
    VCR.use_cassette("recipes") do
      recipe_id = 'nil'
      recipe = ApiMuncherWrapper.find_recipe(recipe_id)
      get recipe_path(recipe_id)

      flash[:alert].must_equal "Invalid recipe"
      must_respond_with :redirect
      must_redirect_to recipes_path
    end

  end

end

require "test_helper"

describe SearchController do
  it "should get home page" do
    get root_path
    must_respond_with :success
  end

  it "can get recipes index" do

    VCR.use_cassette("recipes") do
      get recipes_path

      query = "chicken"
      RecipeApiWrapper.find_recipes(query)
      must_respond_with :ok
    end
    must_respond_with :success
  end

  it "should get show" do
    VCR.use_cassette("recipes") do
      get recipe_path("7bf4a371c6884d809682a72808da7dc2")

      recipe_id = "7bf4a371c6884d809682a72808da7dc2"
      RecipeApiWrapper.get_recipe(recipe_id)
      must_respond_with :ok
    end
    must_respond_with :success
  end

  it "should redirect to root if recipe id is not valid" do
    VCR.use_cassette("recipes") do
      get recipe_path("not_valid_recipe")

      recipe_id = "not_valid_recipe"
      RecipeApiWrapper.get_recipe(recipe_id)

    end
    must_respond_with :redirect
  end

end

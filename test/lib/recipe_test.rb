require 'test_helper'

describe "Recipe" do

  it "cannot be initialized with less than 7 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new("fries")
    }.must_raise ArgumentError

    proc {
      Recipe.new("fries", "fries.com")
    }.must_raise ArgumentError

    proc {
      Recipe.new("fries","fries.com", ["potatoes", "oil", "salt"])
    }.must_raise ArgumentError

    proc {
      Recipe.new("fries", "fries.com", ["potatoes", "oil", "salt"], "vegan")
    }.must_raise ArgumentError

    proc {
      Recipe.new("fries", "fries.com", ["potatoes", "oil", "salt"], "vegan", "image.blah.jpg")
    }.must_raise ArgumentError
  end

  it "Must initialize name, link, ingredients, dietary info, and recipie id properly" do
    recipe = Recipe.new("fries", "fries.com", ["potatoes", "oil", "salt"], "image.jpg", "fries_fires.com", "no nuts", "vegan", "potatoes")

    recipe.name.must_equal "fries"
    recipe.link.must_equal "fries.com"
    recipe.ingredients.must_equal ["potatoes", "oil", "salt"]
    recipe.diet_info.must_equal "vegan"
    recipe.id.must_equal "123"
  end
end


describe "ApiMuncherWrapper" do

  # This code goes where an API call would be made
  # Use the cassetee called channels to
  it "Can get recipes with valid querry and page number" do
    VCR.use_cassette("recipes") do
      query = "avocado"
      page = 0

      response = ApiMuncherWrapper.get_recipes(query, page)

      recipe_count = response[0]
      recipes = response[2]

      recipe_count.nil? must_equal false
# this is confirming that the wrapper is returning recipes
      recipes[0].must_be_instance_of Recipe
      recipes[(recipe_count -1)].must_be_instance_of Recipe
# this is checking the status of the api response.
      response["ok"].must_equal true
    end
  end

  it "Redirects to root for get recipes requests with invalid querry" do
    VCR.use_cassette("recipes") do
      query = nil
      page = 0

      ApiMuncherWrapper.get_recipes(query, page)
      expect(response).to :not_found
      response["error"].wont_be_nil
    end
  end

  it "Redirects to root for get recipes requests with invalid page number" do
    VCR.use_cassette("recipes") do
      query = "avocado"
      page = -999

      response = ApiMuncherWrapper.get_recipes(query, page)
      response["ok"].must_equal false
      response["error"].wont_be_nil
    end
  end
end

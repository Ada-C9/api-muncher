require 'test_helper'
require 'pry'

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
    recipe = Recipe.new("fries.com", "fries", ["potatoes", "oil", "salt"], "image.jpg", "fries_fires.com", "no nuts", "vegan")

    recipe.name.must_equal "fries"
    recipe.link.must_equal "fries_fires.com"
    recipe.ingredients.must_equal ["potatoes", "oil", "salt"]
    recipe.allergy.must_equal "no nuts"
  end
end


describe "ApiMuncherWrapper" do

  # This code goes where an API call would be made
  # Use the cassetee called channels to
  it "Can get recipes with valid querry and page number" do
    VCR.use_cassette("recipes") do
      query = "avocado"
      page = 0

      data = ApiMuncherWrapper.get_recipes(query, page)

      recipe_count = data[0].to_i
      recipes = data[2]

      recipe_count.nil?.must_equal false

      recipes[0].must_be_instance_of Recipe

      # each call to api only returns a list of 10 recipes
      recipes[9].must_be_instance_of Recipe
    end
  end

  # it "Redirects to root for get recipes requests with invalid querry" do
  #   VCR.use_cassette("recipes") do
  #     query = nil
  #     page = 0
  #
  #     ApiMuncherWrapper.get_recipes(query, page)
  #     expect(response).to :not_found
  #     response["error"].wont_be_nil
  #   end
  # end

  # it "Redirects to root for get recipes requests with invalid page number" do
  #   VCR.use_cassette("recipes") do
  #     query = "avocado"
  #     page = -999
  #
  #     response = ApiMuncherWrapper.get_recipes(query, page)
  #     expect(response).to :not_found
  #     response["error"].wont_be_nil
  #   end
  # end
end

describe "recipes_controller" do

  describe "index" do

    it "should sucessfully show index of all recipes with valid data in params" do

    end

    it "should redirect to root with invalid data in params" do

    end

  end

  describe "show" do

    it "should sucessfully show recipe details with valid data in params" do

    end

    it "should redirect to root with invalid data in params" do

    end

  end

end

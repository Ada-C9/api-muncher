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
  it "Can get recipes with valid query and page number" do
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

  it "Returns an empty array of recipes and 0 recipe_count for recipe matches for invalid query" do
    VCR.use_cassette("recipes") do
      query = 999999
      page = 0

      data = ApiMuncherWrapper.get_recipes(query, page)

      recipe_count = data[0].to_i
      recipes = data[2]

      recipe_count.must_equal 0

      recipes.count.must_equal 0
      # I am unsure how to test the negative using the testing example from class:
      # it "Can't send message to fake channel" do
      #   VCR.use_cassette("channels") do
      #     response = SlackApiWrapper.send_msg("this-channel-does-not-exist", "test message")
      #     response["ok"].must_equal false
      #     response["error"].wont_be_nil
      #   end
      # end

    end
  end

  it "Returns an empty array of recipes and 0 recipe_count for invalid page number" do
    VCR.use_cassette("recipes") do
      query = "avocado"
      page = -999

      data = ApiMuncherWrapper.get_recipes(query, page)

      recipe_count = data[0]
      recipes = data[2]

      recipe_count.must_equal []

      recipes.count.must_equal []
    end
  end
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

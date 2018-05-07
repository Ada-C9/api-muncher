require 'test_helper'

describe <Recipe> do

  it "cannot be initialized with less than 5 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "fries"
    }.must_raise ArgumentError

    proc {
      Recipe.new "fries" "fries.com"
    }.must_raise ArgumentError

    proc {
      Recipe.new "fries" "fries.com" "potatoes, oil, salt"
    }.must_raise ArgumentError

    proc {
      Recipe.new "fries" "fries.com" "potatoes, oil, salt" "vegan"
    }.must_raise ArgumentError
  end

  # Is the JSON passing integers as strings or integers? Yes, it is cool with integer, but I am unsure how this r value will be passed to use from the api
  it "Must initialize name, link, ingredients, dietary info, and recipie id properly" do
    recipe = Recipe.new ("fries", "fries.com" "potatoes, oil, salt", "vegan", 123)
    recipe.name.must_equal "fries"
    recipe.link.must_equal "fries.com"
    recipe.ingredients.must_equal "fries.com" "potatoes, oil, salt"
    recipe.diet_info.must_equal "vegan"
    recipe.id.must_equal "123"
  end
end

# creates recipe instances from q and r request
# can I test the actual api muncher wrapper?
# how do I test a wrapper? copy the testing in the slack wrapper code example
# can access specific recipes

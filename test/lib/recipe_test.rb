require 'test_helper'
# this is in the lib test only

describe <Recipe> do

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

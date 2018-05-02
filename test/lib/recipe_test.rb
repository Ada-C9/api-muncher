require 'test_helper'

describe Recipe do

  it "raises an error without all required parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new("Name")
    }.must_raise ArgumentError
  end

  it "must initialize parameters correctly" do
    recipe = Recipe.new("name", "www.fooditem.com", ['ingredients'], "chicken.jpg", ["dairy free" "soy free"])
    recipe.name.must_equal "name"
    recipe.url.must_equal "www.fooditem.com"
    recipe.ingredients.must_equal ['ingredients']
    recipe.image.must_equal "chicken.jpg"
    recipe.dietary_info.must_equal ["dairy free" "soy free"]
  end
  
end

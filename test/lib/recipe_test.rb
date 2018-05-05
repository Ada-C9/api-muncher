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
    recipe = Recipe.new("name", "www.fooditem.com", ['ingredients'], "chicken.jpg", ["dairy free" "soy free"], "www.foodz", "food network")
    recipe.name.must_equal "name"
    recipe.uri.must_equal "www.fooditem.com"
    recipe.ingredients.must_equal ['ingredients']
    recipe.image.must_equal "chicken.jpg"
    recipe.dietary_info.must_equal ["dairy free" "soy free"]
    recipe.url.must_equal "www.foodz"
    recipe.source.must_equal "food network"
  end

  it "retrieves the id from the uri" do
    recipe = Recipe.new("name", "www.fooditem.com_123", ['ingredients'], "chicken.jpg", ["dairy free" "soy free"], "www.foodz", "food network")

    recipe.get_id.must_equal "123"
  end
end

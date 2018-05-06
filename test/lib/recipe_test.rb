require 'test_helper'

describe Recipe do
  it "Cannot be initialized with less than 3 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "Title"
    }.must_raise ArgumentError

    proc {
      Recipe.new "Title", "ID"
    }.must_raise ArgumentError
  end

  it "Must initialize name, id, & image properly" do
    recipe = Recipe.new("Title", "ID", "Image")
    recipe.title.must_equal "Title"
    recipe.id.must_equal "ID"
    recipe.img.must_equal "Image"
  end

  it "Must initialize options properly" do
    options = {
      source: "Source",
      labels: "Lables",
      ingredients: "Ingred",
      url: "WWW"
    }

    recipe = Recipe.new("Title", "ID", "Image", options)
    recipe.source.must_equal "Source"
    recipe.labels.must_equal "Lables"
    recipe.ingredients.must_equal "Ingred"
    recipe.url.must_equal "WWW"
  end
end

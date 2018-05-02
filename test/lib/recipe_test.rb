require 'test_helper'

describe Recipe do
  it "Must initialize label, source, image, uri, ingredients, and count properly" do
    uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_c513b886ac38461ca5ed70b162994566"

    recipe = Recipe.new("label", "source", "image", uri, "ingredients", "count")
    recipe.label.must_equal "label"
    recipe.source.must_equal "source"
    recipe.image.must_equal "image"
    recipe.id.must_equal "c513b886ac38461ca5ed70b162994566"
    recipe.count.must_equal "count"
  end

  it "Must not initialize an invalid recipe" do
    proc {
      recipe = Recipe.new()
    }.must_raise ArgumentError
  end

  it "must parse uri to id" do
    id = Recipe.parse_uri("http://www.edamam.com/ontologies/edamam.owl#recipe_c513b886ac38461ca5ed70b162994566")
    id.must_equal "c513b886ac38461ca5ed70b162994566"
  end
end

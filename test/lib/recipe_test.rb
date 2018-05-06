require 'test_helper'

describe Recipe do
  it "Cannot be initialized with less than 2 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new({label: "Label"})
    }.must_raise ArgumentError
  end

  it "Must initialize label & uri properly" do
    recipe = Recipe.new({label: "Label", uri: "uri"})
    recipe.label.must_equal "Label"
    recipe.must_respond_to :label
    recipe.uri.must_equal "uri"
  end

  it "Must initialize all fields" do
    recipe = Recipe.new({label: "Label", uri: "uri", url: "url", image: "image", source: "source", ingredient_lines: ["ingredientLines"], diet_labels: ["dietLabels"], health_labels: ["healthLabels"]})

    recipe.must_respond_to :url
    recipe.url.must_equal "url"
    recipe.must_respond_to :image
    recipe.image.must_equal "image"
    recipe.must_respond_to :source
    recipe.source.must_equal "source"
    recipe.must_respond_to :ingredient_lines
    recipe.ingredient_lines.must_equal ["ingredientLines"]
    recipe.must_respond_to :diet_labels
    recipe.diet_labels.must_equal ["dietLabels"]
    recipe.must_respond_to :health_labels
    recipe.health_labels.must_equal ["healthLabels"]
  end
end

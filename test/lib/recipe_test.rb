require 'test_helper'

describe Recipe do

  it "raises an error if doesn't have proper arguments passed in" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new("uri")
    }.must_raise ArgumentError

    proc {
      Recipe.new("uri", "title")
    }.must_raise ArgumentError

    proc {
      Recipe.new("uri", "title", "image")
    }.must_raise ArgumentError

    proc {
      Recipe.new("uri", "title", "image", "source")
    }.must_raise ArgumentError

    proc {
      Recipe.new("uri", "title", "image", "source", "url")
    }.must_raise ArgumentError

    proc {
      Recipe.new("uri", "title", "image", "source", "url", "ingredients")
    }.must_raise ArgumentError
  end

  it "must initialize fields properly" do
    recipe = Recipe.new("abc12345678123456781234567812345678", "title", "image", "source", "url", ["ingredients"], ["diet_labels"])

    recipe.must_respond_to :id
    recipe.id.must_equal "12345678123456781234567812345678"
    recipe.must_respond_to :title
    recipe.title.must_equal "title"
    recipe.must_respond_to :image
    recipe.image.must_equal "image"
    recipe.must_respond_to :source
    recipe.source.must_equal "source"
    recipe.must_respond_to :url
    recipe.url.must_equal "url"
    recipe.must_respond_to :ingredients
    recipe.ingredients.must_equal ["ingredients"]
    recipe.must_respond_to :diet_labels
    recipe.diet_labels.must_equal ["diet_labels"]
  end

end

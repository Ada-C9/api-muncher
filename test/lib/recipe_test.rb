require 'test_helper'

describe Recipe do

  before do

  end

  it "Must initialize with the required parameters (uri, label, url) and optional variables ( image, source, ingredientLines, dietLabels)" do
    recipe = Recipe.new(@uri, @label, @url, options = { ingredientLines: @ingredientLines, dietLabels: @dietLabels, image: @image, source: @source})

    recipe.uri.must_equal @uri
    recipe.label.must_equal @label
    recipe.url.must_equal @url

    recipe.ingredientLines.must_equal @ingredientLines
    recipe.dietLabels.must_equal @dietLabels
    recipe.image.must_equal @image
    recipe.source.must_equal @source
  end

  it "Cannot be initialized without the required parameters" do
    proc {
      Recipe.new()
    }.must_raise ArgumentError

    proc {
      Recipe.new(@uri, @label)
    }.must_raise ArgumentError
  end

end

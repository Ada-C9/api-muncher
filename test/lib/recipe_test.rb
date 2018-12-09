require 'test_helper'

describe Recipe do

  before do

    @uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_b79327d05b8e5b838ad6cfd9576b30b6"
    @label = "Chicken Vesuvio"
    @url = "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html"
    @dietLabels = ["Low-Carb"]
    @ingredientLines = [
      "1/2 cup olive oil",
      "5 cloves garlic, peeled",
      "2 large russet potatoes, peeled and cut into chunks",
      "1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)",
      "3/4 cup white wine",
      "3/4 cup chicken stock",
      "3 tablespoons chopped parsley",
      "1 tablespoon dried oregano",
      "Salt and pepper",
      "1 cup frozen peas, thawed"]
    @image = "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg"
    @source = "Serious Eats"
  end

  it "can initialize with the required parameters (uri, label, url) and optional variables ( image, source, ingredientLines, dietLabels)" do
    recipe = Recipe.new(@uri, @label, @url, options = { ingredientLines: @ingredientLines, dietLabels: @dietLabels, image: @image, source: @source})

    recipe.uri.must_equal @uri
    recipe.label.must_equal @label
    recipe.url.must_equal @url

    recipe.ingredientLines.must_equal @ingredientLines
    recipe.dietLabels.must_equal @dietLabels
    recipe.image.must_equal @image
    recipe.source.must_equal @source
  end

  it "cannot be initialized without the required parameters (uri, label, url)" do

    proc {
      Recipe.new()
    }.must_raise ArgumentError

    proc {
      Recipe.new(@uri, @label)
    }.must_raise ArgumentError

    proc {
      Recipe.new(@uri, @url)
    }.must_raise ArgumentError


  end

end

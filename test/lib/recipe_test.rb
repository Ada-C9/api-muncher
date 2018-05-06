require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "can be created with params" do
      label = "test recipe"
      image = "https://www.edamam.com/web-img/7a2/7a2f41a7891e8a8f8a087a96930c6463.jpg"
      source = "test source"
      url = "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
      healthLabels = [
                    "Sugar-Conscious",
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"
                    ]
      ingredientLines = [
                    "1 whole chicken, 3 1/2 to 4 pounds",
                    "Kosher salt and freshly ground black pepper"
                    ]
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"

      recipe = Recipe.new(label, image, source, url, healthLabels, ingredientLines, uri)

      recipe.label.must_equal label
      recipe.image.must_equal image
      recipe.source.must_equal source
      recipe.url.must_equal url
      recipe.health_labels.must_equal healthLabels
      recipe.ingredients.must_equal ingredientLines
      recipe.uri.must_equal uri
    end

    it "cannot be created without a label" do
      proc { Recipe.new() }.must_raise ArgumentError
      proc { Recipe.new(nil) }.must_raise ArgumentError
      proc { Recipe.new('') }.must_raise ArgumentError
    end
  end

  describe "from_api" do
    before do
      @fake_recipe_data = {
        "label" => "test recipe",
        'source' => "test source",
        'uri' => "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
      }
    end

    it "Pulls the relevant information into an instance of Channel" do
      recipe = Recipe.from_api(@fake_recipe_data)


      recipe.must_be_kind_of Recipe
      recipe.label.must_equal @fake_recipe_data["label"]
      recipe.source.must_equal @fake_recipe_data["source"]
      recipe.uri.must_equal @fake_recipe_data["uri"]
    end

    it "Raises an exception without critical data" do
      @fake_recipe_data["label"] = nil
      # can also write the above as @fake_recipe_data.delete("name")

      proc {
        Recipe.from_api(@fake_recipe_data)
      }.must_raise

    end
  end
end

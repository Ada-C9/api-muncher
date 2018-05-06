require "test_helper"

describe Recipe do
  describe 'initialize' do

    it 'can be created with uri, label, image, healthLabels and ingredientLines' do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
      label = 'test label',
      image = "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
      healthLabels = [
        "Sugar-Conscious",
        "Peanut-Free",
        "Tree-Nut-Free",
        "Alcohol-Free"
      ],
      ingredientLines = [
        "1/2 cup (125ml) mirin",
        "1/2 cup (125ml) soy sauce",
        "One 2-inch (5cm) piece of fresh ginger, peeled and grated",
        "2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)"
      ],
      url = [ "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
      ]

      recipe = Recipe.new(uri, label, image, healthLabels, ingredientLines, url)

      recipe.uri.must_equal uri
      recipe.label.must_equal label
      recipe.image.must_equal image
      recipe.healthLabels.must_equal healthLabels
      recipe.ingredientLines.must_equal ingredientLines
    end

    it 'cannot be created without a label' do
      proc { Recipe.new() }.must_raise ArgumentError
      proc { Recipe.new(nil) }.must_raise ArgumentError
      proc { Recipe.new(" ") }.must_raise ArgumentError

    end
  end

  describe 'from_api' do
    before do
      @fake_recipe_data = {
        "uri" => "12345",
        "label" => "test label",
      }
    end

    it 'pulls the relevant information into an instance of recipe' do
      recipe = Recipe.from_api(@fake_recipe_data)

      recipe.must_be_kind_of Recipe
      recipe.label.must_equal @fake_recipe_data["label"]
      recipe.uri.must_equal @fake_recipe_data["uri"]
    end

    it 'Raises an exception without critical data' do
      @fake_recipe_data["label"] = nil
      proc {
        Recipe.from_api(@fake_recipe_data)
      }.must_raise
    end
  end

end

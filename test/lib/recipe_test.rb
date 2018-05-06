require 'test_helper'

describe Recipe do
  describe 'initialize' do
    it 'can be created with all recipe parameters' do
    uri = 'http://www.edamam.com/ontologies/edamam.owl#recipe_b1a783e4ad64f147e4bf3344464602c6'
    label = 'Grilled Kale'
    image = 'https://www.edamam.com/web-img/19e/19e5ea32ef3e12bdd4ba0abc04797ed0.jpg'
    url = 'http://leitesculinaria.com/86679/recipes-grilled-kale.html'
    source = "Leite's Culinaria"
    healthLabels = [
                    "Sugar-Conscious",
                    "Vegan",
                    "Vegetarian",
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"
                  ]
    ingredientLines = [
                    "2 bunches lacinato kale (also known as black, dinosaur, or Tuscan kale)",
                    "2 tablespoons extra-virgin olive oil",
                    "Kosher salt"
                ]
    recipe = Recipe.new(uri, label, image, url, source, healthLabels, ingredientLines)

    recipe.uri.must_equal uri
    recipe.label.must_equal label
    recipe.image.must_equal image
    recipe.url.must_equal url
    recipe.source.must_equal source
    recipe.healthLabels.must_equal healthLabels
    recipe.ingredientLines.must_equal ingredientLines

    end

    it 'cannot be created without all the recipe parameters' do
      proc { Recipe.new() }.must_raise ArgumentError
      proc { Recipe.new('label') }.must_raise ArgumentError
      proc { Recipe.new(nil, 'b1a783e4ad64f147e4bf3344464602c6') }.must_raise ArgumentError
      proc { Recipe.new('', 'b1a783e4ad64f147e4bf3344464602c6') }.must_raise ArgumentError
    end
  end

  describe 'from_api' do
    before do
      @bogus_data = {
        "uri" => "999999999",
        "label" => 'Grilled Developer Brains',
        "image" => 'https://d3nmt5vlzunoa1.cloudfront.net/pycharm/files/2013/06/TiredProgrammer.jpg',
        "url" => 'https://medium.com/glitch/learning-about-learning-about-what-we-want-to-be-learning-9bd58e674d29',
        "source" => "Workforce Guinea Pigs",
        "healthLabels" => [
                        "Super-Human",
                        "Really-Hard-Working",
                        "Time-Off-Free"
                      ],
        "ingredientLines" => [
                        "2 shots rye whiskey on the rocks",
                        "3 hours sleep",
                        "5 moments of panic"
                    ]
      }
    end

    it 'pulls the relevant info into an instance of Recipe' do
      recipe = Recipe.from_api(@bogus_data)

      recipe.must_be_kind_of Recipe
      recipe.uri.must_equal @bogus_data["uri"]
      recipe.label.must_equal @bogus_data["label"]
      recipe.image.must_equal @bogus_data["image"]
      recipe.url.must_equal @bogus_data["url"]
      recipe.source.must_equal @bogus_data["source"]
      recipe.healthLabels.must_equal @bogus_data["healthLabels"]
      recipe.ingredientLines.must_equal @bogus_data["ingredientLines"]
    end

    it 'Raises an exception without essential data' do
      @bogus_data["label"] = nil
      proc {
        Recipe.from_api(@bogus_data)
      }.must_raise
    end
  end


end

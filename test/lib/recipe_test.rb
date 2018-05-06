require 'test_helper'

# downloads configuration and gems
# not using must respond to since we are not testing a controller

describe Recipe do

  before do
    recipe = {
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
      "label" => "Teriyaki Chicken",
      "image" => "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
      "source" => "David Lebovitz",
      "ingredientLines" =>  [
        "1/2 cup (125ml) mirin",
        "1/2 cup (125ml) soy sauce"
      ],
      "dietLabels" => [
        "Low-Carb"
      ],
      "healthLabels" => [
        "Sugar-Conscious",
        "Peanut-Free"
      ],
      "url" => "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
    }

    @new_recipe = Recipe.new(recipe)
  end

  it "raises an error if it does not have 1 parameter (recipe hash)" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "Must initialize properly with a hash" do
    @new_recipe.id.must_equal "7bf4a371c6884d809682a72808da7dc2"
  end

  it "must initialize with name, image, contributor, ingredients, dietary label and health labels" do
    @new_recipe.name.must_equal "Teriyaki Chicken"
    @new_recipe.image.must_equal "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
    @new_recipe.contributor.must_equal "David Lebovitz"
    @new_recipe.ingredients.must_equal [
      "1/2 cup (125ml) mirin",
      "1/2 cup (125ml) soy sauce"
    ]
    @new_recipe.dietary_labels.must_equal ["Low-Carb"]
    @new_recipe.health_labels.must_equal [
      "Sugar-Conscious",
      "Peanut-Free"
    ]
    @new_recipe.url.must_equal "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
  end
end

require 'test_helper'

describe Recipe do

  before do
    recipe = {
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_b79327d05b8e5b838ad6cfd9576b30b6",
      "label" => "Chicken Vesuvio",
      "image" => "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg",
      "source" => "Serious Eats",
      "ingredientLines" =>  [
        "1/2 cup olive oil",
        "5 cloves garlic, peeled",
        "2 large russet potatoes, peeled and cut into chunks",
        "1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)"
      ],
      "dietLabels" => [
        "Low-Carb"
      ],
      "healthLabels" => [
        "Sugar-Conscious",
        "Peanut-Free",
        "Tree-Nut-Free"
      ],
      "url" => "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html"
    }
    @new_recipe = Recipe.new(recipe)
  end

  it "raises an error if it does not have 1 parameter" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "Must initialize properly with a hash" do
    @new_recipe.id.must_equal "b79327d05b8e5b838ad6cfd9576b30b6"
  end

  it "must initialize with name, image, contributor, ingredients, dietary label and health labels" do
    @new_recipe.name.must_equal "Chicken Vesuvio"
    @new_recipe.image.must_equal "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg"
    @new_recipe.contributor.must_equal "Serious Eats"
    @new_recipe.ingredients.must_equal [
      "1/2 cup olive oil",
      "5 cloves garlic, peeled",
      "2 large russet potatoes, peeled and cut into chunks",
      "1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)"
    ]
    @new_recipe.dietary_labels.must_equal ["Low-Carb"]
    @new_recipe.health_labels.must_equal [
      "Sugar-Conscious",
      "Peanut-Free",
      "Tree-Nut-Free"
    ]
    @new_recipe.url.must_equal "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html"
  end
end

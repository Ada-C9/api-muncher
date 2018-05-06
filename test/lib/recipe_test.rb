require 'test_helper'

describe Recipe do

  it "raises an error when given no argument" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "initialize arguments properly" do
    recipe_hash = {
      "label" => "Ube Bread",
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_671e958ebea08ebd5ef85e5c836ef9ed",
      "image" => "https://www.edamam.com/web-img/562/56220fb54fd8d7b78c64de7c4555feae.jpg",
      "url" => "http://www.thedailymeal.com/recipes/ube-bread-recipe",
      "source" => "The Daily Meal",
      "ingredientLines" => [
                    "2  Tablespoons   brown sugar",
                    "1/4  Cup   all-purpose flour",
                    "1  Teaspoon   salt",
                    "1  Teaspoon   cinnamon",
                    "2  Tablespoons   unsalted butter",
                    "Unsalted butter or cooking spray, for the loaf pan",
                    "2  Cups   all-purpose flour",
                    "1  Teaspoon   baking soda",
                    "1  Teaspoon   baking powder",
                    "1  Teaspoon   salt",
                    "1 1/2  Cup   sugar",
                    "1  Cup   grated purple yam (ube)",
                    "1  Cup   milk",
                    "2   large eggs",
                    "1  Teaspoon   vinegar or lemon juice"
                ],
      "healthLabels" => [
                    "Vegetarian",
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"
                ]
    }

    recipe = Recipe.new(recipe_hash)

    recipe.label.must_equal "Ube Bread"
    recipe.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_671e958ebea08ebd5ef85e5c836ef9ed"
    recipe.source.must_equal "The Daily Meal"

  end



end

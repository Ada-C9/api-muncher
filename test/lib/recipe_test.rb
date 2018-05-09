require 'test_helper'

describe Recipe do
  it "Can be initialized" do
    recipe_hash = {
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_05751760488f3258aac732cc11165480",
      "label" => "Nooch-Its recipes",
      "image" => "https://www.edamam.com/web-img/3c5/3c590eb9e6d52aa837009faee9848f47",
      "source" => "eatwithinyourmeans.com",
      "url" => "http://eatwithinyourmeans.com/nooch-its/",
      "healthLabels" => [
        "Vegetarian",
        "Peanut-Free",
        "Tree-Nut-Free",
        "Alcohol-Free"
      ],
      "ingredientLines" => [
        "⅔ c. chickpea flour",
        "⅓ c. oat flour (can be made by grinding up whole oats in food processor)",
        "1½ T. nutritional yeast (the nooch!)",
        "1 tsp. sea salt",
        "¼ tsp. garlic powder or granulated garlic",
        "¼ tsp. onion powder or granulated onion",
        "⅛ tsp. paprika",
        "3 T. refined coconut oil, vegan butter, or other neutral flavored oil (such as grapeseed)",
        "3-5 T. cold water or plain/unsweetened non-dairy yogurt (check to make sure it's not vanilla!)"
      ]
    }
    recipe = Recipe.new(recipe_hash)

    recipe.label.must_equal "Nooch-Its recipes"
    recipe.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_05751760488f3258aac732cc11165480"
    recipe.source.must_equal "eatwithinyourmeans.com"

  end

  it "raises an error when given no argument" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end

end

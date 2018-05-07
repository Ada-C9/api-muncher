require 'test_helper'


describe Recipe do

  it "can be initialized" do
    test_recipe = Recipe.new(
      "Blue Hawaiian", "https://www.edamam.com/web-img/f9f/f9fd803ba7bfba3e6386b442ddd85e93.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_7672acaa8a7d579023657aa9e7674daf",
      "Delish", "http://www.delish.com/cooking/recipe-ideas/recipes/a11351/blue-hawaiian-recipe-smnf0510/",
      [
        "1 oz. Smirnoff Orange Vodka",
        "1 oz. blue curaçao",
        "2 oz. orange juice",
        "1 oz. pineapple juice",
        "1 slice orange"
                ],
      [
        "Low-Fat"
      ]
    )

    test_recipe.must_be_instance_of Recipe
    test_recipe.name.must_equal "Blue Hawaiian"
    test_recipe.ingredient_lines.must_be_kind_of Array
    test_recipe.ingredient_lines.count.must_equal 5
    test_recipe.diet_labels.must_be_kind_of Array
    test_recipe.diet_labels.length.must_equal 1
  end

end

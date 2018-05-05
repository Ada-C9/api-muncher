require 'test_helper'
require 'pry'

describe Recipe do
  before do
    @recipe_hash = {
                "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_3c5cf4968fa095cbdd9fca6ab5389e9c",
                "label": "Pickled Brains recipes",
                "image": "https://www.edamam.com/web-img/811/811a71bad21d73adb7fc6e92801f8ec4",
                "source": "Martha Stewart",
                "url": "http://www.marthastewart.com/318853/pickled-brains",
                "shareAs": "http://www.edamam.com/recipe/pickled-brains-recipes-3c5cf4968fa095cbdd9fca6ab5389e9c/brains",
                "yield": 10,
                "dietLabels": [
                    "Low-Fat"
                ],
                "healthLabels": [
                    "Vegan",
                    "Vegetarian",
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"
                ],
                "ingredientLines": [
                    "1 cup red-wine vinegar",
                    "3 cups white-wine vinegar",
                    "1 cup sugar",
                    "1/2 cup salt",
                    "1 tablespoon black peppercorns",
                    "1 tablespoon brown mustard seeds",
                    "5 or 6 red pearl onions",
                    "2 to 3 heads cauliflower"
                ],
                "calories": 1366.364111111111,
                "totalWeight": 2607.5571417181254,
                "totalTime": 70,
                "totalNutrients": {
                    "ENERC_KCAL": {
                        "label": "Energy",
                        "quantity": 1366.3641111111112,
                        "unit": "kcal"
                    },
                    "FAT": {
                        "label": "Fat",
                        "quantity": 6.355004444444445,
                        "unit": "g"
                    },
                    "CHOCDF": {
                        "label": "Carbs",
                        "quantity": 281.5975088888889,
                        "unit": "g"
                    },
                    "PROCNT": {
                        "label": "Protein",
                        "quantity": 29.17638333333333,
                        "unit": "g"
                    }
                }
              }

  end

  it "can be created with valid data" do
    recipe = Recipe.from_api(@recipe_hash)
    recipe.name.must_equal "Recipe name"
  end
end

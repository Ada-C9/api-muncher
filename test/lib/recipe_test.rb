require 'test_helper'

describe Recipe do
  before do
    data = {
      "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_3c5cf4968fa095cbdd9fca6ab5389e9c",
      "label": "Pickled Brains recipes",
      "image": "https://www.edamam.com/web-img/811/811a71bad21d73adb7fc6e92801f8ec4",
      "source": "Martha Stewart",
      "url": "http://www.marthastewart.com/318853/pickled-brains",
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
      "totalNutrients": {
        "ENERC_KCAL": {
          "label": "Energy",
          "quantity": 948.5783323955536,
          "unit": "kcal"
        },
        "FAT": {
          "label": "Fat",
          "quantity": 66.042283310318,
          "unit": "g"
        }
      }
    }

    @recipe = Recipe.new(data[:label],
      data[:uri],
      data[:url],
      data[:source],
      options = {
        image: data[:image],
        ingredients: data[:ingredientLines],
        calories:data[:calories]}
      )
    end
  describe "initialize" do
      it "can be created with valid data" do
        @recipe.must_be_kind_of Recipe
        @recipe.name.must_equal "Pickled Brains recipes"
        @recipe.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_3c5cf4968fa095cbdd9fca6ab5389e9c"
        @recipe.image.must_equal "https://www.edamam.com/web-img/811/811a71bad21d73adb7fc6e92801f8ec4"
        @recipe.ingredients.must_equal [
          "1 cup red-wine vinegar",
          "3 cups white-wine vinegar",
          "1 cup sugar",
          "1/2 cup salt",
          "1 tablespoon black peppercorns",
          "1 tablespoon brown mustard seeds",
          "5 or 6 red pearl onions",
          "2 to 3 heads cauliflower"
        ]
        @recipe.calories.must_equal 1366.364111111111
        @recipe.link.must_equal "http://www.marthastewart.com/318853/pickled-brains"
        @recipe.source.must_equal "Martha Stewart"
      end

      it "raises error if data is incomplete" do
        proc { Recipe.new() }.must_raise ArgumentError
        proc { Recipe.new("uri", "label") }.must_raise ArgumentError
        proc { Recipe.new("", "", "", "") }.must_raise ArgumentError
      end

      it "raises error if required data contain nil" do
        proc { Recipe.new("name", nil, "image", "ingredients", "calories", "link", "source") }.must_raise ArgumentError
      end
    end
  describe "id" do
      it "must return the id of a uri" do
        @recipe.id.must_equal "3c5cf4968fa095cbdd9fca6ab5389e9c"
      end
  end
end

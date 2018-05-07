describe 'Recipe' do
  describe "initialize" do
    it "must raise error if recipe is nil" do
      recipe = nil
      proc{ Recipe.new(recipe) }.must_raise StandardError
    end

    it "must create instance with valid details" do
      data = {
        "label" => "test lable",
        "image" => "https://www.image.com",
        "source" => "test name",
        "url" => "https://www.url.com",
        "totalTime" => 50,
        "calories" => 1200,
        "ingredients" => [
          "1 cup ingredient one",
          "1/2 cup ingredient two",
        ],
        "digest" => [
            "nutrient1" => {
              "nutrient" => "fat",
              "total_amt" => 5,
              "daily_recommended" => 50,
              "unit" => "g"
            },
            "nutrient2" =>
          {
            "label" => "sodium",
            "total" => 1.75,
            "daily" => 2,
            "unit" => "g"
          }
        ]
      }

      test_recipe = Recipe.new(data)
      test_recipe.must_be_kind_of Recipe

      test_recipe.label.must_equal data["label"]
      test_recipe.image.must_equal data["image"]
      test_recipe.source.must_equal data["source"]
      test_recipe.link.must_equal data["url"]
      test_recipe.time.must_equal data["totalTime"]
      test_recipe.calories.must_equal data["calories"].round
      test_recipe.ingredients.must_equal data["ingredients"]
      test_recipe.nutrition_info.must_equal data["digest"]
    end
  end

end

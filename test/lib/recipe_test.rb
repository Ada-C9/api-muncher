require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "can be created with sufficient info" do
      raw_recipe = {
        "label" => "Vegetables Fried Rice",
        "uri" => "I-am-uri",
        "image" => "https://www.seriouseats.com/recipes/images/2016/01/20160206-fried-rice-food-lab-68-1500x1125.jpg",
        "calories" => 400,
        "ingridientLines" => ["1 cup peas", "2 cups cooked rice"],
        "dietLabels" => ["low fat", "sugar free"]
      }

      recipe = Recipe.new(raw_recipe)
      recipe.name.must_equal raw_recipe["label"]
      recipe.uri.must_equal raw_recipe["uri"]
    end

    it "cannot be created without sufficient info" do
      raw_recipe = {
        "uri" => "I-am-uri",
        "image" => "https://www.seriouseats.com/recipes/images/2016/01/20160206-fried-rice-food-lab-68-1500x1125.jpg",
        "calories" => 400
      }

      proc {
        Recipe.new
      }.must_raise ArgumentError

      proc {
        Recipe.new(raw_recipe)
      }.must_raise ArgumentError
    end
  end
end

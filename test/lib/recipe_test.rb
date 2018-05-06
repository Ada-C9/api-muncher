require 'test_helper'

describe Recipe do

  describe 'initialize' do

    it "can be initialized with all the required parameters" do
      test_recipe = Recipe.new("test-name", "www.food.com", ["one", "two", "three"], "www.food.png", ["four", "five", "six"], "www.yummly.com", "yummly")

      test_recipe.name.must_equal "test-name"
      test_recipe.uri.must_equal "www.food.com"
      test_recipe.ingredients.must_equal ["one", "two", "three"]
      test_recipe.image.must_equal "www.food.png"
      test_recipe.dietary_info.must_equal ["four", "five", "six"]
      test_recipe.url.must_equal "www.yummly.com"
      test_recipe.source.must_equal "yummly"
    end

    it "raises an error if a required parameter is missing" do
      proc { Recipe.new() }.must_raise ArgumentError
      proc { Recipe.new("www.food.com", ["one", "two", "three"], "www.food.png", ["four", "five", "six"], "www.yummly.com", "yummly") }.must_raise ArgumentError
      proc { Recipe.new("test-name") }
    end

  end

end

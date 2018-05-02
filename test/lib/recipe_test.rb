require 'test_helper'

describe Recipe do
  before do
    @label = "pesto chicken test"
    @image = "test img"
    @url = "www.google.com"
    @ingredientlines = "chicken, pasta, pesto, oliveoil"
    @totalnutrients = "78800, 31409 fat, carbs carbs"

  end

  it 'can be created with all valid info' do

    recipe = Recipe.new(label: @label, image: @image, url: @url, ingredientlines: @ingredientlines, totalnutrients: @totalnutrients)

    recipe.label.must_equal @label
    recipe.image.must_equal @image
    recipe.url.must_equal @url
    recipe.ingredientlines.must_equal @ingredientlines
    recipe.totalnutrients.must_equal @totalnutrients
  end

  it 'cant be created without valid info' do
    proc{ Recipe.new(image: @image, url: @url, ingredientlines: @ingredientlines) }.must_raise ArgumentError
    proc{ Recipe.new(label: @label, image: @image, totalnutrients: @totalnutrients) }.must_raise ArgumentError
    proc{ Recipe.new(label:"", image: @image, url: @url, ingredientlines: @ingredientlines, totalnutrients: @totalnutrients) }.must_raise ArgumentError
  end

  describe 'from_api' do
    before do
      @fake_recipe_data = {
        "label" => "pesto chicken test",
        "image" => "test img",
        "url" => "www.google.com",
        "ingredientlines" => "chicken, pasta, pesto, oliveoil",
        "totalNutrients" => [78800, 31409, "fat", "carbs carbs"]
      }
    end

    it "pulls the relevant information into an instance of Recipe" do
      recipe = Recipe.from_api(@fake_recipe_data)

      recipe.must_be_kind_of Recipe
      recipe.label.must_equal @fake_recipe_data["label"]
      recipe.image.must_equal @fake_recipe_data["image"]
      recipe.url.must_equal @fake_recipe_data["url"]
      recipe.ingredientlines.must_equal @fake_recipe_data["ingredientlines"]
      recipe.totalnutrients.must_equal @fake_recipe_data["totalNutrients"]
    end

    it 'raises an exception without a label' do
      @fake_recipe_data["label"] = nil
      proc{ Recipe.from_api(@fake_recipe_data)}.must_raise
    end
  end
end

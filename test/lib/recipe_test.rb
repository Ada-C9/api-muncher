require 'test_helper'

describe 'Recipe' do
  describe 'initialize' do

    it "cannot be initialized with less than the required parameters" do
      label = "teriyaki chicken"
      image = "image"
      calories = "calories"

      proc {
        recipe = Recipe.new(label,image,calories)
      }.must_raise StandardError
    end

    it "initializes when all parameters are given" do
      label = "teriyaki chicken"
      image = "image"
      calories = "calories"
      url = "url"
      uri = "uri"
      ingredients = "ingredients"
      health = "health"
      source = "source"

      recipe = Recipe.new(label,image,calories,url,uri,ingredients,health,source)

      recipe.label.must_equal label
    end
  end

  describe 'from_api' do
    before do
      @recipe_raw_data = {
        "label" => "teriyaki chicken",
        "image" => "image",
        "calories" => "calories",
        "url" => "url",
        "uri" => "uri",
        "ingredients" => "ingredients",
        "health" => "health",
        "source" => "source"
      }
    end

    it "gets the correct info and puts in an instance of Recipe" do
      recipes = Recipe.from_api(@recipe_raw_data)

      recipes.must_be_kind_of Recipe
      recipes.label.must_equal @recipe_raw_data["label"]

    end

    it "raises an error when bad data is passed back" do
      @recipe_raw_data = nil

      proc {
        recipes = Recipe.from_api(@recipe_raw_data)
      }.must_raise StandardError


    end
  end
end

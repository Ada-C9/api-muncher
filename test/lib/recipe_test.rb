require "test_helper"
require 'minitest-rails'

describe Recipe do
  describe "initialize" do
    it "can be created with all parameters needed" do
      label = "label"
      image = "image"
      health = "health"
      ingredients = "ingredients"
      url = "url"
      uri = "uri"

      recipe = Recipe.new(label, image, health, ingredients, url, uri)

      recipe.label.must_equal label
      recipe.uri.must_equal uri
    end


    it "cannot be created without a label or an uri" do

      proc { Recipe.new()}.must_raise ArgumentError
      proc { Recipe.new(uri)}.must_raise ArgumentError

    end

  end

  describe "from_api" do

    before do
      @fake_recipe = {
        "label" => "chicken",
        "image" => "photo",
        "health" => "health",
        "ingredients" => "ingredients",
        "url" => "url",
        "uri" => "uri",
      }
    end


      it "pulls the relevant information into an instance of recipe" do
        recipe = Recipe.from_api(@fake_recipe)

        recipe.must_be_kind_of Recipe
        recipe.label.must_equal @fake_recipe["label"]
        recipe.uri.must_equal @fake_recipe["uri"]
      end

      it "raises and exception without critical data" do
        @fake_recipe["label"] = nil
         proc { Recipe.from_api(@fake_recipe)}.must_raise
      end


    end
  end

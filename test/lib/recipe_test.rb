require 'test_helper'

describe Recipe do
  describe 'initialize' do
    it 'can be created with 6 parameters' do
      uri = "something",
      url = "url",
      label ="label",
      image = "image",
      healthlabels = ["peanuts"],
      ingredientlines = ["1 cup"]

      recipes = Recipe.new(uri, url, label, image, healthlabels, ingredientlines)

      recipes.uri.must_equal uri
      recipes.url.must_equal url
      recipes.label.must_equal label
      recipes.image.must_equal image
      recipes.healthlabels.must_equal healthlabels
      recipes.ingredientlines.must_equal ingredientlines

    end
    it 'Cannot be initialized with less than 6 parameters' do
      proc {
        Recipe.new()
      }.must_raise ArgumentError
    end

    describe 'from_api' do
      before do
        @fake_data = {
          "uri" => 'uri',
          "url" => 'url',
          "label" => "test channel",
          "image" => 'image',
          "healthLabels" => 'peanuts',
          "ingredientLines" => "asdkfjlskdjf"
        }
      end

      it 'Pulls the relevant information into an instance of Recipe' do
        new_recipe = Recipe.from_api(@fake_data)

        new_recipe.must_be_kind_of Recipe
        new_recipe.url.must_equal @fake_data["url"]
        new_recipe.label.must_equal @fake_data["label"]
        new_recipe.uri.must_equal @fake_data["uri"]
        new_recipe.image.must_equal @fake_data["image"]
        new_recipe.healthlabels.must_equal @fake_data["healthLabels"]
        new_recipe.ingredientlines.must_equal @fake_data["ingredientLines"]
      end

      it 'Raises an exception without critical data' do
        @fake_data["label"] = nil
        proc {
          Recipe.from_api(@fake_data)
        }.must_raise
      end

    end
  end
end

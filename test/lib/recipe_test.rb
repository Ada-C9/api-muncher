require 'test_helper'

describe "recipe" do
  describe "initialize" do
    it "can be created with required values" do
      uri = "test value"
      label = "test recipe label"
      opts = {}
      opts["servings"] = 8

      recipe = Recipe.new(uri, label, opts)

      recipe.label.must_equal label
      recipe.uri.must_equal uri
    end

    it "raises an error if not enough arguments are provided" do
      label = "chicken dinner"
      proc { Recipe.new(label)}.must_raise ArgumentError
    end

    it "accepts optional arguments" do
      label = "Best Label"
      uri = "Uridiculous"
      opts = {
        url: "http:://homestarrunner.com",
        servings: "200"
      }
      recipe = Recipe.new(uri, label, opts)

      recipe.url.must_equal opts["url"]
      recipe.servings.must_equal opts["servings"]

    end
  end
end

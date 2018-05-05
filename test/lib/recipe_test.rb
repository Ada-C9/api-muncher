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
  end
end

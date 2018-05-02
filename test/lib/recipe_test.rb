require 'test_helper'

describe "recipe" do
  describe "initialize" do
    it "can be created with label" do
      label = "test recipe label"

      recipe = Recipe.new(label)

      recipe.label.must_equal label
    end
  end
end

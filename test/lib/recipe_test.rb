require 'test_helper'

describe "recipe" do
  describe "initialize" do
    it "can be created with required values" do
      label = "test recipe label"
      uri = "test value"
      label = "test value"
      image = "test value"
      url = "test value"
      servings = "test value"
      ingredients = "test value"
      health_labels = "test value"
      calories = "test value"
      fat = "test value"
      saturated_fat = "test value"
      mono_fat = "test value"
      carbs = "test value"
      protein = "test value"
      sodium = "test value"
      fiber = "test value"
      cholesterol = "test value"

      recipe = Recipe.new(
        uri,
        label,
        image,
        url,
        servings,
        ingredients,
        health_labels,
        calories,
        fat,
        saturated_fat,
        mono_fat,
        carbs,
        protein,
        sodium,
        fiber,
        cholesterol)

      recipe.label.must_equal label
      recipe.uri.must_equal uri
    end
  end
end

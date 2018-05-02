require 'test_helper'

describe Recipe do
  it "can be created with valid data" do
    recipe_data = {
    label: "Chicken Teriaki",
    image: "image_url",
    orig_url: "orig_url",
    ingredients: ["ing1", "ing2", "ing3"],
    diet: ["diet1", "diet2", "diet3"],
    health: [],
    uri: "uri"
  }

    recipe = Recipe.new(recipe_data)

    recipe.label.must_equal recipe_data[:label]
    recipe.image.must_equal recipe_data[:image]
    recipe.orig_url.must_equal recipe_data[:orig_url]
    recipe.uri.must_equal recipe_data[:uri]
    recipe.ingredients.must_equal recipe_data[:ingredients]
    recipe.diet.must_equal recipe_data[:diet]
    recipe.health.must_equal recipe_data[:health]
  end

  # it "cannot be created without a name or ID" do
  #   proc {Channel.new()}.must_raise ArgumentError
  #   proc {Channel.new('name')}.must_raise ArgumentError
  #   proc {Channel.new("", 12345)}.must_raise ArgumentError
  #
  # end
  #
  describe 'from_api' do
    before do
      @fake_recipe_data = {
      "recipe" => {
        "label" => "Chicken Teriaki",
        "image" => "image_url",
        "orig_url" => "orig_url",
        "ingredients" => ["ing1", "ing2", "ing3"],
        "diet" => ["diet1", "diet2", "diet3"],
        "health" => [],
        "uri" => "uri"
      }}
    end

    it "pulls the relevant information into an instance of Recipe" do
      recipe = Recipe.from_api(@fake_recipe_data)

      recipe.must_be_kind_of Recipe
      recipe.label.must_equal @fake_recipe_data["recipe"]["label"]
      recipe.image.must_equal @fake_recipe_data["recipe"]["image"]
      recipe.orig_url.must_equal recipe_data[:orig_url]
      recipe.uri.must_equal recipe_data[:uri]
      recipe.ingredients.must_equal recipe_data[:ingredients]
      recipe.diet.must_equal recipe_data[:diet]
      recipe.health.must_equal recipe_data[:health]

    end
  #
  #   it "raises an exception without critical data" do
  #     @fake_channel_data["name"] = nil
  #
  #     proc { Channel.from_api(@fake_channel_data)}.must_raise
  #   end
  end
end

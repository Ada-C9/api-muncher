require 'test_helper'

describe Recipe do
  it "can be initialized" do
    recipe = Recipe.new(
      "uri_id",
      "Lemon Chicken",
      "photo_url",
      "original_url",
      "Company",
      [
        "some ingredients",
        "more ingredients",
        "other ingredients"
      ],
      [
        "diet thing"
      ],
      [
        "health thing"
      ]
    )

    recipe.must_be_instance_of Recipe
  end

  it "has an id, name, photo, recipe_url, source, ingredients array, dietary label array, and health label array" do
    recipe = Recipe.new(
      "uri_id",
      "Lemon Chicken",
      "photo_url",
      "original_url",
      "Company",
      [
        "some ingredients",
        "more ingredients",
        "other ingredients"
      ],
      [
        "diet thing"
      ],
      [
        "health thing"
      ]
    )

    recipe.id.must_equal "uri_id"
    recipe.name.must_equal"Lemon Chicken"
    recipe.photo.must_equal "photo_url"
    recipe.url.must_equal "original_url"
    recipe.source.must_equal "Company"
    recipe.ingredients.must_be_kind_of Array
    recipe.ingredients.must_include "some ingredients"
    recipe.diet_labels.must_be_kind_of Array
    recipe.diet_labels.must_include "diet thing"
    recipe.health_labels.must_be_kind_of Array
    recipe.health_labels.must_include "health thing"
  end
end

require 'test_helper'
require 'pry'

describe Recipe do
  before do
    @recipe_hash = {
      "label" => "Recipe name",
      "uri" => "www.api-uri.com",
      "image" => "image.jpg",
      "ingredientLines" => ["1 cup of stuff", "1/2 cups of other stuff"],
      "calories" => "1000",
      "url" => "www.recipe-origin.com",
      "source" => "Recipe Source Name"
    }
  end
  it "can be created with valid data" do
    recipe = Recipe.from_api(@recipe_hash)
    recipe.name.must_equal "Recipe name"
  end
end

require 'test_helper'

describe Recipe do

  before do
    recipe = {
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_42c0f6c2441352c5900eee4ce9f3f7e0",
      "label" => "Kimchi Pasta",
      "image" => "https://www.edamam.com/web-img/6c9/6c9960eaf107c71cffdaed4e57ff8bdf.jpg",
      "url" => "http://norecipes.com/kimchi-pasta-recipe",
      "recipe_source" => "No Recipes"
    }
    @new_recipe = Recipe.new(recipe)
  end

  it "Cannot be initialized with less than 1 parameter" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end
end

require 'test_helper'

describe Recsearch do
  before do
    rec2 = {
      "recipe" => {
        "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_spicychicken",
        "label" => "Spicy Chicken",
        "source" => "Recipe Website",
        "image" => "https://somepath",
        "website" => "https://www",
        "ingredients" => ["ingredient1", "ingredient two"],
        "yield" => "4",
        "totalTime" => "2 hours",
        "healthLabels" => ["low sugar"]
      }
    }
    rec_1 = {
      "recipe" => {
        "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_spicychicken",
        "label" => "Spicy Chicken",
        "source" => "Recipe Website",
        "image" => "https://somepath",
        "website" => "https://www",
        "ingredients" => ["ingredient1", "ingredient two"],
        "yield" => "4",
        "totalTime" => "2 hours",
        "healthLabels" => ["low sugar"]
      }
    }
    @recipe_list = [rec_1,rec2]
  end


  it "cannot be initialized without two arguments" do
    proc {
      Recsearch.new
    }.must_raise ArgumentError

    proc {
      Recsearch.new("search term")
    }.must_raise ArgumentError
  end

  it "must initialize with query" do
    result = Recsearch.new("some query", @recipe_list)

    result.must_respond_to :query
    result.query.must_equal "some query"
  end

  it "must initialize with a collection of recipes" do
    result = Recsearch.new("some query", @recipe_list)

    result.must_respond_to :recipes
    result.recipes.each do |r|
      r.must_be_kind_of Recipe
    end
  end
end

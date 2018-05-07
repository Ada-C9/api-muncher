require 'test_helper'

describe Recipe do
  before do
    @recipe = {
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

  end


  it "cannot be initialized without a hash argument" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recsearch.new("string")
    }.must_raise
  end

  it "must initialize with attributes" do
    result = Recipe.new(@recipe)

    result.must_respond_to :id
    result.must_respond_to :title
    result.must_respond_to :author
    result.must_respond_to :image
    result.must_respond_to :website
    result.must_respond_to :ingredients
    result.must_respond_to :yield
    result.must_respond_to :time
    result.must_respond_to :labels
  end
end

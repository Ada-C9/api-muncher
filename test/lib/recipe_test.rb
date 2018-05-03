require "test_helper"

describe Recipe do
  let(:recipe) {
    {
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_b66666d5c882ca199f43def8f1b8a03f",
      "label" => "Caramel Cake",
      "image" => "https://www.edamam.com/web-img/482/482417e9943411f0e7db4be74a7b5114.jpg",
      "url" => "http://www.lottieanddoof.com/2009/02/my-favorite-cake-period/",
      "dietLabels" => [ ],
      "ingredients" => [
        {
        "text" => "2 cup sifted cake flour(not self-rising; sift before measuring),for cake",
        "weight" => 274.0
        },
        {
        "text" => "2 tbsp sifted cake flour,for cake",
        "weight" => 17.2
        }
      ]
    }
  }

  describe "initialize" do
    it "creates a recipe instance with all correct params" do
      response = Recipe.new(recipe)
      response.must_be_kind_of Recipe
      response.id.must_equal "_b66666d5c882ca199f43def8f1b8a03f"
      response.ingredients.must_be_kind_of Array
    end

    it "cannot create Recipe instance without recipe hash" do
      proc {
        Recipe.new()
      }.must_raise ArgumentError
    end
  end
end

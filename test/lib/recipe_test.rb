require "test_helper"

describe Recipe do
  describe 'initialize' do
    it 'can be created with valid data' do
      label = "Chicken Teriyaki"
      image = "https://www.edamam.com/web-img/827/8275cc33e9f0f4314617d5a356900aa7.jpg"
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_0a3f49a3da07cd8379d4e35f7a1a72fc"
      url = "http://norecipes.com/blog/2009/07/16/chicken-teriyaki-recipe/"
      ingredient_list = [
                    "1/2 cup water",
                    "2 tablespoons Japanese soy sauce",
                    "2 tablespoons dark brown sugar",
                    "2 tablespoons mirin",
                    "4-6 skin-on filleted (boneless) chicken thighs",
                    "2 tablespoons mild flavored honey (or maltose)",
                    "2 tablespoons dark soy sauce",
                    "2 tablespoons sake"]
      health_labels = [
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"]
      source = "No Recipe"

      test = Recipe.new(label, image, uri, url, ingredient_list, health_labels, source)

      test.must_be_kind_of Recipe

      test.label.must_equal label
      test.image.must_equal image
      test.uri.must_equal uri
      test.url.must_equal url
      test.ingredient_list.must_equal ingredient_list
      test.health_labels.must_equal health_labels
      test.source.must_equal source


    end

    it "won't be created with invalid data" do
      label = "Chicken Teriyaki"
      image = "https://www.edamam.com/web-img/827/8275cc33e9f0f4314617d5a356900aa7.jpg"
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_0a3f49a3da07cd8379d4e35f7a1a72fc"
      url = "http://norecipes.com/blog/2009/07/16/chicken-teriyaki-recipe/"
      ingredient_list = [
                    "1/2 cup water",
                    "2 tablespoons Japanese soy sauce",
                    "2 tablespoons dark brown sugar",
                    "2 tablespoons mirin",
                    "4-6 skin-on filleted (boneless) chicken thighs",
                    "2 tablespoons mild flavored honey (or maltose)",
                    "2 tablespoons dark soy sauce",
                    "2 tablespoons sake"]
      health_labels = [
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"]
      source = nil

      proc{
        test = Recipe.new(label, image, uri, url, ingredient_list, health_labels, source)}.must_raise

    end

  end

  describe 'from_api' do
    before do
      @test_data = {
        "label" => "Chicken Teriyaki",
        "image" => "https://www.edamam.com/web-img/827/8275cc33e9f0f4314617d5a356900aa7.jpg",
        "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_0a3f49a3da07cd8379d4e35f7a1a72fc",
        "url" => "http://norecipes.com/blog/2009/07/16/chicken-teriyaki-recipe/",
        "ingredient_list" => [
          "1/2 cup water",
          "2 tablespoons Japanese soy sauce",
          "2 tablespoons dark brown sugar",
          "2 tablespoons mirin",
          "4-6 skin-on filleted (boneless) chicken thighs",
          "2 tablespoons mild flavored honey (or maltose)",
          "2 tablespoons dark soy sauce",
          "2 tablespoons sake"],
          "health_labels" => [
            "Peanut-Free",
            "Tree-Nut-Free",
            "Alcohol-Free"],
          "source" => "No Recipe"
          }
    end

    it "creates a new recipe with valid data" do
      test = Recipe.from_api(@test_data)

      test.must_be_kind_of Recipe
    end

    it "raises an error with invalid data" do
      @test_data["source"] = nil

      proc {
        test = Recipe.from_api(@test_data) }.must_raise

    end

  end

end

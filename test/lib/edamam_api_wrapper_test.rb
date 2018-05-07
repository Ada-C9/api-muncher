require 'test_helper'

describe EdamamApiWrapper do

  describe "search recipes" do

    it "can search for recipes " do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_recipes("kale")
        response.must_be_kind_of Array
        response[0].must_be_instance_of Recipe
      end
    end

    it "will return empty array if no recipe exists " do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_recipes("xxxxx")
        response.count.must_equal 0
      end
    end

    # it "can list all recipes " do
    # #   VCR.use_cassette("recipes") do
    # #
    # #   end
    # end

  end

  # describe "get recipe" do
  #   it "can get a recipe" do
  # #     VCR.use_cassette("recipes") do
  # #       response = EdamamApiWrapper.search_recipes("kale")
  # #       recipe = response[0]
  # #       result = EdamamApiWrapper.show_recipe(recipe.uri_trim)
  # #       result.must_be_kind_of Recipe
  # #     end
  #   end
  # end

  describe "show recipe" do
    it "can show a recipe" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_recipes("kale")
        recipe = response[0]
        result = EdamamApiWrapper.show_recipe(recipe.uri_trim)
        result.must_be_kind_of Recipe
        result.label.upcase.must_include "KALE"
      end
    end

    it "cannot show a recipe with an invalid id" do
      VCR.use_cassette("recipes") do
        proc {
          EdamamApiWrapper.show_recipe("abcdef")
        }.must_raise ArgumentError
      end
    end
  end

end

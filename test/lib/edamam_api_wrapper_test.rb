require 'test_helper'

describe "EdamamApiWrapper" do
  describe "list_all_recipes" do
    it "returns a list of recipes" do
      VCR.use_cassette("recipes") do
        search = "chicken"
        recipes = EdamamApiWrapper.list_all_recipes(search)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "raises an error if the response code is not 200" do
      # not quite sure how to simulate a  bad response
    end
  end

  describe "get_recipe" do
    it "gets one recipe" do
      skip
      VCR.use_cassette("recipes") do
        uri = a_request.first[uri]

        recipe = EdamamApiWrapper.get_recipe(uri)
        recipe.must_be_kind_of Recipe

      end
    end

    it "raises and error and error if the recipe does not exist" do
      skip
      VCR.use_cassette("recipes") do
        uri = 3

        proc {
          EdamamApiWrapper.get_recipe(uri)
        }.must_raise ArgumentError

      end
    end
  end
end

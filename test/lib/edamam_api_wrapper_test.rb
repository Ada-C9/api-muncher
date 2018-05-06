require 'test_helper'

describe EdamamApiWrapper do
  describe "self.list_recipes" do
    it "can send a valid query to api" do
      query = "soup"

      VCR.use_cassette("results") do
        response = EdamamApiWrapper.list_recipes(query)

        response.must_be_kind_of Array
        response.first.must_be_kind_of Recipe
      end
    end

    it "returns empty array for an invalid query" do
      query = "$%*%"

      VCR.use_cassette("results") do
        response = EdamamApiWrapper.list_recipes(query)

        response.must_be_empty
      end
    end
  end

  describe "show_recipe" do
    it "can retreve information about a recipe" do
      id = "7543ecfa28b7506a97360748f017a83e"

      VCR.use_cassette("results") do
        response = EdamamApiWrapper.show_recipe(id)

        response.must_be_kind_of Recipe
      end
    end

    it "returns nil for invalid id" do
      VCR.use_cassette("results") do
        id = "000"
        response = EdamamApiWrapper.show_recipe(id)

        response.must_be_nil
      end
    end
  end
end

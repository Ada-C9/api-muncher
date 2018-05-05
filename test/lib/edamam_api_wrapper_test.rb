require 'test_helper'

describe EdamamApiWrapper do
  describe "get_recipes" do
    it "Can query recipes from api" do
      VCR.use_cassette("recipes") do
        query = {:search => "pumpkin pie"}
        response = EdamamApiWrapper.get_recipes(query)
        response.must_be_kind_of Array
        response.length.must_equal 50
      end
    end

    it "Returns empty array for edgey queries" do
      VCR.use_cassette("recipes") do
        query = {:search => ""}
        response = EdamamApiWrapper.get_recipes(query)
        response.must_be_kind_of Array
        response.must_equal []
      end
      VCR.use_cassette("recipes") do
        query = {:search => "?"}
        response = EdamamApiWrapper.get_recipes(query)
        response.must_be_kind_of Array
        response.must_equal []
      end
      VCR.use_cassette("recipes") do
        query = {:search => nil}
        response = EdamamApiWrapper.get_recipes(query)
        response.must_be_kind_of Array
        response.must_equal []
      end
    end
  end

  describe "show_recipe" do
    it "returns a single recipe" do
      VCR.use_cassette("recipes") do
        query = {:search => "pumpkin pie"}
        response = EdamamApiWrapper.get_recipes(query)
        response.length.must_equal 50

        a = response.first.id
        b = EdamamApiWrapper.show_recipe(a)

        b.class.must_equal Recipe
        b.id.must_equal a
      end
    end

    it "returns nil if recipe is invalid" do
      VCR.use_cassette("recipes") do
        query = {:search => "pumpkin pie"}
        response = EdamamApiWrapper.get_recipes(query)

        a = response.last.id.to_i + 1
        EdamamApiWrapper.show_recipe(a).must_be_nil
      end
    end
  end
end

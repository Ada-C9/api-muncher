require 'test_helper'

describe EdamamApiWrapper do
  describe "get_recipes" do
    it "Can query recipes from api" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.get_recipes("pumpkin pie")
        response.must_be_kind_of Array
        response.length.must_equal 10
      end
    end

    it "Puts nothing in the array if invalid" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.get_recipes("")
        response.must_be_kind_of Array
        response.must_equal []
      end
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.get_recipes("?")
        response.must_be_kind_of Array
        response.must_equal []
      end
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.get_recipes(nil)
        response.must_be_kind_of Array
        response.must_equal []
      end
    end
  end

  describe "show_recipe" do
    it "returns a single recipe" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.get_recipes("pumpkin pie")
        response.length.must_equal 10

        a = response.first.id
        b = EdamamApiWrapper.show_recipe(a)

        b.class.must_equal Recipe
        b.id.must_equal a
      end
    end
  end
end

require 'test_helper'
require 'pry'

describe EdamamApiWrapper do

  describe 'list_recipes method' do
    it "retrieves list of recipes from a given search" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.list_recipes("chicken")

        response.must_be_kind_of Array
        response.first.must_be_kind_of Recipe
      end
    end

    it "returns no recipes for incorrect params" do
      invalid_search = nil
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.list_recipes(invalid_search)

        response.first.must_equal nil
        response.count.must_equal 0
      end
    end

  end

  describe 'show_recipe method' do
    it "can retrieve a specific, valid recipe" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.show_recipe("http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2")

        response.id.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
        response.must_be_kind_of Recipe
      end
    end

    it "returns an error for incorrect params" do

    end

  end
end

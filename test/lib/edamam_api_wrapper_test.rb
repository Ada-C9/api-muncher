require 'test_helper'

describe EdamamApiWrapper do
  describe'list_recipes' do

    it "can return an array of recipe objects" do
      VCR.use_cassette("search") do
        recipes = EdamamApiWrapper.list_recipes("chocolate")

        recipes.must_be_instance_of Array

        recipes.each do |r|
          r.must_be_instance_of Recipe
        end
      end
    end
  end

  it "will return an empty array for a search that returns no results" do
      VCR.use_cassette("search") do
        recipes = EdamamApiWrapper.list_recipes("")

        recipes.must_equal []
      end
    end
end

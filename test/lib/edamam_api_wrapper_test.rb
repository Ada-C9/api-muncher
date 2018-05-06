require 'test_helper'

describe EdamamApiWrapper do
  describe 'search' do
    it "calls keyword_search to give a list of recipes" do
      VCR.use_cassette('chicken') do
        recipes = EdamamApiWrapper.search("chicken")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "raises an error if an invalid search is returned" do
      VCR.use_cassette('chicken') do
        proc { EdamamApiWrapper.search("Europa")}.must_raise
      end
    end

    it "calls recipe_search to return a single recipe" do
      VCR.use_cassette('chicken') do
        recipes = EdamamApiWrapper.search("chicken")

        uri = recipes.first.uri.split('owl')[1]

        recipe = EdamamApiWrapper.search(uri)
        result = recipe.uri.include?(uri)

        recipe.must_be_kind_of Recipe
        result.must_equal true

      end
    end

    it "raises an error if an invalid search result occured" do
      VCR.use_cassette('chicken') do
        uri = "#recipe_slider"
        proc {EdamamApiWrapper.search(uri)}.must_raise
      end
    end
  end
end

require 'test_helper'

describe EdamamApiWrapper do
  describe 'search' do
    it "gives a list of recipes" do
      VCR.use_cassette('chicken') do
        recipes = EdamamApiWrapper.search("chicken")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end
end

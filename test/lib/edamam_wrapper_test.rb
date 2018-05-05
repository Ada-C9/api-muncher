require 'test_helper'

describe EdamamWrapper do
  describe 'search_recipes' do
    it "gives a list of recipes" do
      VCR.use_cassette('recipes') do
        recipes = EdamamWrapper.search_recipes("brains")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe

        end
      end


    end
  end
end

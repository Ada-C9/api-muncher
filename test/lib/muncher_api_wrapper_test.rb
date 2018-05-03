require 'test_helper'

describe MuncherApiWrapper do
  describe 'list_recipes' do

    it 'gives a list of recipes' do
      VCR.use_cassette('recipes') do
        recipes = MuncherApiWrapper.list_recipes

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end

    end
  end



end

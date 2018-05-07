require 'test_helper'

describe MuncherApiWrapper do
  describe 'list_recipes' do

    it 'gives a list of recipes' do
      VCR.use_cassette('recipes') do
        recipes = MuncherApiWrapper.list_recipes("food")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end

    end

    describe 'show' do
      it 'gives one recipe' do
        VCR.use_cassette('recipe') do
          recipe = MuncherApiWrapper.show("9b5945e03f05acbf9d69625138385408")
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end
end

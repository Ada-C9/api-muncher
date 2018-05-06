require 'test_helper'

describe EdamamApiWrapper do
  describe 'one_recipe' do
    it 'returns one recipe' do
      VCR.use_cassette('recipe') do
        recipe = EdamamApiWrapper.one_recipe("b1a783e4ad64f147e4bf3344464602c6")

        recipe.must_be_kind_of Recipe
      end
    end
  end

  describe 'all_recipes' do
    it 'returns all recipes' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.all_recipes("kale")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end


end

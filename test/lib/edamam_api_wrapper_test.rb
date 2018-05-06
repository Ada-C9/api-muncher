require "test_helper"

describe EdamamApiWrapper do

  describe 'list_recipes' do

    it 'gives a list of recipes' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_recipes('ceviche')

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end # it do

  end # list_recipes

  describe 'show_recipe' do

  end # show_recipe

end # EdamamApiWrapper
